import 'dart:async';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
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
import 'package:donuts/src/names/state/list_state_impl_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

final _formatter = DartFormatter();

class ListStateGenerator extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  final BuilderOptions options;

  ListStateGenerator(this.config, this.options);

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
    final apiDomain = options.config['api_domain'] as String?;
    final apiVersion = options.config['api_version'] as String?;
    if (apiDomain == null) {
      throw Exception("api_domain is not set");
    }
    if (apiVersion == null) {
      throw Exception("api_version is not set");
    }

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

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final repositoryException = ExceptionName(
      exceptionBaseName:
          "${aggregateRootName.element.displayName}RepositoryImpl",
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
      apiDomain: apiDomain,
      apiVersion: apiVersion,
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

    final listStateImpl = ListStateImplName(
      aggregateRootName: aggregateRootName,
      applicationServiceProviderName: applicationServiceProvider,
    );

    final provider = Field((f) {
      f.name = listStateImpl.myInstanceName;
      f.modifier = FieldModifier.final$;
      f.assignment = Code('''
AsyncNotifierProvider<${listStateImpl.myClassName}, List<${aggregateRootName.myClassName}>>(${listStateImpl.myClassName}.new)
''');
    });

    final dependenciesImportList = aggregateRootName
        .dependenciesImportPathList()
        .map((e) => Directive.import(e.identifier));

    final lib = Library(((p0) {
      p0.body.add(provider);

      p0.directives.addAll([
        Directive.import("package:riverpod/riverpod.dart"),
        Directive.import(aggregateRootName.myPath),
        Directive.import(applicationServiceProvider.myPath),
      ]);

      p0.directives.addAll(dependenciesImportList);

      if (aggregateRootName.customListState) {
        p0.directives.add(Directive.part(listStateImpl.myPartPath));
        p0.docs.add(
            "/// [${aggregateRootName.myClassName}] is interface or abstract");
        p0.docs.add("/// must be implement custom factory.");
        p0.docs.add(
            "/// Please check Section XXX in https://pub.dev/packages/donuts");
        p0.docs.add(
            "/// create file : ${aggregateRootName.myClassName.toSnakeCase()}.list_state_impl.custom.dart");
        p0.docs
            .add("/// Please copy and paste the following text into the file");
        p0.docs.add("/*");

        p0.docs.add(
            "part of '${aggregateRootName.myClassName.toSnakeCase()}.list_state_impl.dart';");
        p0.docs.add(_formatter
            .format('${listStateImpl.toClassElement().accept(DartEmitter())}'));
        p0.docs.add("*/");
      } else {
        p0.body.add(
          listStateImpl.toClassElement(),
        );
      }
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
