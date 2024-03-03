import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/factory/factory_impl_name.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen/source_gen.dart';

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
    final aggregateRootName =
        await elementChecker(element, annotation, buildStep);

    final factoryName = AbstractInterfaceFactoryName(
      aggregateRootName: aggregateRootName,
    );

    final factoryException = ExceptionName(
      exceptionBaseName: "${factoryName.myClassName}",
    );

    final factoryImpl = FactoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceFactoryName: factoryName,
      exceptionName: factoryException,
    ).toClassElement();

    final lib = Library(((p0) {
      p0.body.add(factoryImpl);
      p0.body.add(factoryException.toClassElement());

      if (aggregateRootName.keyType == "String" ||
          aggregateRootName.keyFactoryName == null) {
        if (!aggregateRootName.isInterface) {
          p0.directives.addAll([
            Directive.import("package:uuid/uuid.dart"),
          ]);
        }
      } else {
        p0.directives.addAll([
          Directive.import("package:donuts_annotation/donuts_annotation.dart"),
        ]);
      }
      p0.directives.addAll([
        Directive.import(aggregateRootName.myPath),
        Directive.import(factoryName.myPath),
      ]);
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
