import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/application_service/abstract_interface_application_service_name.dart';
import 'package:donuts/src/names/application_service/application_service_impl_name.dart';
import 'package:donuts/src/names/application_service/application_service_provider_name.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/factory/factory_impl_name.dart';
import 'package:donuts/src/names/factory/factory_provider_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_api_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/repository/api_impl_name.dart';
import 'package:donuts/src/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_provider_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';
import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';

final _formatter = DartFormatter();

class ApplicationServiceProviderGenerator
    extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  ApplicationServiceProviderGenerator(this.config);

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
    final factoryException = ExceptionName(
      exceptionBaseName: "${factoryName.myClassName}Exception",
    );

    final factoryNameImpl = FactoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceFactoryName: factoryName,
      exceptionName: factoryException,
    );

    final repositoryException = ExceptionName(
      exceptionBaseName:
          "${aggregateRootName.element.displayName}RepositoryImpl",
    );

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final abstractInterfaceApiName = AbstractInterfaceApiName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final repositoryImplName = RepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
      exceptionName: repositoryException,
      abstractInterfaceApiName: abstractInterfaceApiName,
    );

    final inMemoryRepositoryImpl = InMemoryRepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final exception = ExceptionName(
      exceptionBaseName:
          "${aggregateRootName.element.displayName}ApplicationServiceImpl",
    );
    final applicationService = AbstractInterfaceApplicationServiceName(
      aggregateRootName: aggregateRootName,
    );

    final applicationServiceImplName = ApplicationServiceImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
      abstractInterfaceFactoryName: factoryName,
      exceptionName: exception,
      abstractInterfaceApplicationServiceName: applicationService,
    );

    final factoryProvider = FactoryProviderName(
      aggregateRootName: aggregateRootName,
      factoryName: factoryName,
      factoryNameImpl: factoryNameImpl,
    );

    final apiImplName = ApiImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceApiName: abstractInterfaceApiName,
      exceptionName: ExceptionName(
        exceptionBaseName: "${aggregateRootName.myClassName}ApiImpl",
      ),
    );

    final repositoryProvider = RepositoryProviderName(
      aggregateRootName: aggregateRootName,
      repositoryName: repositoryName,
      repositoryImplName: repositoryImplName,
      inMemoryRepositoryImpl: inMemoryRepositoryImpl,
      inMemory: inMemory,
      apiImplName: apiImplName,
    );

    final applicationServiceProvider = ApplicationServiceProviderName(
      aggregateRootName: aggregateRootName,
      applicationServiceImplName: applicationServiceImplName,
      abstractInterfaceRepositoryName: repositoryName,
      abstractInterfaceFactoryName: factoryName,
      factoryProvider: factoryProvider,
      repositoryProvider: repositoryProvider,
      abstractInterfaceApplicationServiceName: applicationService,
    );

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        applicationServiceProvider.toFieldElement(),
      ]);

      p0.directives.addAll([
        Directive.import('package:riverpod/riverpod.dart'),
      ]);
      if (aggregateRootName.customApplicationService) {
        p0.directives.addAll([
          Directive.import("package:donuts_annotation/donuts_annotation.dart"),
          Directive.import(aggregateRootName.myPath),
          Directive.import(factoryName.myPath),
          Directive.import(repositoryName.myPath),
          Directive.import(factoryProvider.myPath),
          Directive.import(repositoryProvider.myPath),
          Directive.import(applicationService.myPath),
          Directive.import(applicationServiceImplName.myPath),
          Directive.part("${applicationServiceProvider.myPartPath}"),
        ]);
      } else {
        p0.directives.addAll([
          Directive.import(factoryProvider.myPath),
          Directive.import(repositoryProvider.myPath),
          Directive.import(applicationServiceImplName.myPath),
        ]);
      }
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
