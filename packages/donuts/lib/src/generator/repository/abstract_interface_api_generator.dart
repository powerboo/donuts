import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/repository/abstract_interface_api_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class AbstractInterfaceApiGenerator
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

    final repositoryNames = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final abstractInterfaceApi = AbstractInterfaceApiName(
      aggregateRootName: aggregateRootName,
    ).toClassElement();

    final dependenciesImportList = aggregateRootName
        .dependenciesImportPathList()
        .map((e) => Directive.import(e.identifier));

    final lib = Library(((p0) {
      p0.body.addAll([
        abstractInterfaceApi,
      ]);
      p0.directives.addAll([
        Directive.import(repositoryNames.myPath),
        Directive.import(aggregateRootName.myPath),
      ]);
      p0.directives.addAll(dependenciesImportList);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
