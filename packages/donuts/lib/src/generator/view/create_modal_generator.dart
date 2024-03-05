import 'dart:async';
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
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_provider_name.dart';
import 'package:donuts/src/names/state/list_state_impl_name.dart';
import 'package:donuts/src/names/view/create_modal_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

final _formatter = DartFormatter();

class CreateModalGenerator extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  CreateModalGenerator(this.config);

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
    final createModal = CreateModalName(
      aggregateRootName: aggregateRootName,
      listStateImplName: listStateImpl,
    );

    final lib = Library(((p0) {
      p0.body.add(createModal.toClassElement());

      p0.directives.addAll([
        Directive.import("package:flutter/material.dart"),
        Directive.import("package:hooks_riverpod/hooks_riverpod.dart"),
        // Directive.import(aggregateRootName.myPath),
        // Directive.import(listStateImpl.myPath),
      ]);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
