import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

final _formatter = DartFormatter();

class FactoryImplGenerator extends GeneratorForAnnotation<AggregateRoot> {
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
    final (
      constructorElement,
      myPath,
      annotatedElement,
      baseDirectory,
    ) = await elementChecker(element, annotation, buildStep);

    final className = "${element.name}FactoryImpl";

    final String abstractInterfaceFactoryPath = p.join(
      "package:donuts/factory/",
      baseDirectory,
      "${className.toSnakeCase()}.dart",
    );

    final factoryImpl = Class(((p0) {
      // class name
      p0.name = "${element.name}FactoryImpl";

      // body
      final create = Method();
      final restore = Method();

      p0.methods.addAll([create, restore]);
    }));

    final lib = Library(((p0) {
      p0.body.add(factoryImpl);

      p0.directives.add(
        Directive.import(myPath),
      );
      p0.directives.add(
        Directive.import(abstractInterfaceFactoryPath),
      );
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}

class FactoryImplGeneratorException implements Exception {
  late final String message;
  FactoryImplGeneratorException(final String message) {
    this.message = "[FactoryImplGeneratorException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
