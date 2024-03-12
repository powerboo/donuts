import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:built_collection/built_collection.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/application_service/abstract_interface_application_service_name.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/application_service/application_service_impl_name.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class ApplicationServiceImplGenerator
    extends GeneratorForAnnotation<AggregateRoot> {
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
    final aggregateRootName =
        await elementChecker(element, annotation, buildStep);

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final factoryName = AbstractInterfaceFactoryName(
      aggregateRootName: aggregateRootName,
    );

    final exception = ExceptionName(
      exceptionBaseName:
          "${aggregateRootName.element.displayName}ApplicationServiceImpl",
    );

    final applicationService = AbstractInterfaceApplicationServiceName(
      aggregateRootName: aggregateRootName,
    );

    final applicationServiceImpl = ApplicationServiceImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
      abstractInterfaceFactoryName: factoryName,
      exceptionName: exception,
      abstractInterfaceApplicationServiceName: applicationService,
    );

    final dependenciesImportList = aggregateRootName
        .dependenciesImportPathList()
        .map((e) => Directive.import(e.identifier));

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        applicationServiceImpl.toClassElement(),
        exception.toClassElement(),
      ]);

      p0.directives.addAll([
        Directive.import("package:donuts_annotation/donuts_annotation.dart"),
        Directive.import(aggregateRootName.myPath),
        Directive.import(factoryName.myPath),
        Directive.import(repositoryName.myPath),
        Directive.import(applicationService.myPath),
      ]);

      p0.directives.addAll(dependenciesImportList);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
