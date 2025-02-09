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
import 'package:donuts/src/names/state/single_state_impl_name.dart';
import 'package:donuts/src/names/view/detail_view/detail_view_name.dart';
import 'package:donuts/src/names/view/common/header_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

final _formatter = DartFormatter();

class DetailViewGenerator extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  final BuilderOptions options;

  DetailViewGenerator(this.config, this.options);

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

    final apiImplName = ApiImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceApiName: abstractInterfaceApiName,
      exceptionName: ExceptionName(
        exceptionBaseName: "${aggregateRootName.myClassName}ApiImpl",
      ),
      apiDomain: apiDomain,
      apiVersion: apiVersion,
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

    final singleStateImpl = SingleStateImplName(
      aggregateRootName: aggregateRootName,
      applicationServiceProviderName: applicationServiceProvider,
    );

    final headerName = HeaderName(
      aggregateRootName: aggregateRootName,
      title: "[${aggregateRootName.myClassName}]DetailView",
    );

    final singleView = DetailViewName(
      aggregateRootName: aggregateRootName,
      singleStateImplName: singleStateImpl,
      headerName: headerName,
    );

    final dependenciesImportList = aggregateRootName
        .dependenciesImportPathList()
        .map((e) => Directive.import(e.identifier));

    final lib = Library(((p0) {
      p0.body.add(singleView.toClassElement());
      p0.body.addAll(singleView.toModalElement());
      p0.body.add(headerName.toClassElement());

      p0.directives.addAll([
        Directive.import("package:flutter/material.dart"),
        Directive.import("package:hooks_riverpod/hooks_riverpod.dart"),
        Directive.import(aggregateRootName.myPath),
        Directive.import(singleStateImpl.myPath),
      ]);

      p0.directives.addAll(dependenciesImportList);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
