import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:built_collection/built_collection.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names/application_service/application_service_impl_name.dart';
import 'package:donuts/src/generator/common/names/application_service/application_service_provider_name.dart';
import 'package:donuts/src/generator/common/names/common/exception_name.dart';
import 'package:donuts/src/generator/common/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/generator/common/names/factory/factory_impl_name.dart';
import 'package:donuts/src/generator/common/names/factory/factory_provider_name.dart';
import 'package:donuts/src/generator/common/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/generator/common/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/generator/common/names/repository/repository_impl_name.dart';
import 'package:donuts/src/generator/common/names/repository/repository_provider_name.dart';
import 'package:donuts/src/generator/common/names/state/single_state_impl_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class SingleStateGenerator extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  SingleStateGenerator(this.config);
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    return super.generate(library, buildStep);
  }

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    late final bool inMemory;
    if (!config.containsKey("in_memory")) {
      throw InvalidGenerationSourceError(
        "config does not have in_memory.",
        element: element,
      );
    }
    inMemory = config["in_memory"] as bool;

    final aggregateRootName =
        await elementChecker(element, annotation, buildStep);

    final factoryName = AbstractInterfaceFactoryName(
      aggregateRootName: aggregateRootName,
    );
    final factoryNameImpl = FactoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceFactoryName: factoryName,
    );

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final repositoryException = ExceptionName(
      exceptionBaseName:
          "${aggregateRootName.element.displayName}RepositoryImpl",
    );

    final repositoryImplName = RepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
      exceptionName: repositoryException,
    );

    final inMemoryRepositoryImpl = InMemoryRepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final exception = ExceptionName(
      exceptionBaseName:
          "${aggregateRootName.element.displayName}ApplicationServiceImpl",
    );

    final applicationServiceImplName = ApplicationServiceImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
      abstractInterfaceFactoryName: factoryName,
      exceptionName: exception,
    );

    final factoryProvider = FactoryProviderName(
      aggregateRootName: aggregateRootName,
      factoryName: factoryName,
      factoryNameImpl: factoryNameImpl,
    );

    final repositoryProvider = RepositoryProviderName(
      aggregateRootName: aggregateRootName,
      repositoryName: repositoryName,
      repositoryImplName: repositoryImplName,
      inMemoryRepositoryImpl: inMemoryRepositoryImpl,
      inMemory: inMemory,
    );

    final applicationServiceProvider = ApplicationServiceProviderName(
      aggregateRootName: aggregateRootName,
      applicationServiceImplName: applicationServiceImplName,
      abstractInterfaceRepositoryName: repositoryName,
      abstractInterfaceFactoryName: factoryName,
      factoryProvider: factoryProvider,
      repositoryProvider: repositoryProvider,
    );

    final singleStateImpl = SingleStateImplName(
      aggregateRootName: aggregateRootName,
      applicationServiceProviderName: applicationServiceProvider,
    );

    final provider = Field((f) {
      f.name = singleStateImpl.myInstanceName;
      f.modifier = FieldModifier.final$;
      f.assignment = Code('''
AsyncNotifierProvider<${singleStateImpl.myClassName}, ${aggregateRootName.myClassName}?>(${singleStateImpl.myClassName}.new)
''');
    });

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        provider,
        singleStateImpl.toClassElement(),
      ]);

      p0.directives.addAll([
        Directive.import("package:riverpod/riverpod.dart"),
        Directive.import(aggregateRootName.myPath),
        Directive.import(applicationServiceProvider.myPath),
      ]);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
