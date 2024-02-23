import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names/repository/abstract_interface_repository_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class AbstractInterfaceRepositoryGenerator extends GeneratorForAnnotation<AggregateRoot> {
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
    final aggregateRootName = await elementChecker(element, annotation, buildStep);

    final abstractInterfaceRepository = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    ).toClassElement();

    final lib = Library(((p0) {
      p0.body.add(abstractInterfaceRepository);
      p0.directives.add(
        Directive.import(aggregateRootName.myPath),
      );
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
