import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/generator/common/names/factory/factory_impl_name.dart';
import 'package:donuts/src/generator/common/names/factory/factory_provider_name.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen/source_gen.dart';

final _formatter = DartFormatter();

class FactoryProviderGenerator extends GeneratorForAnnotation<AggregateRoot> {
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
    final factoryNameImpl = FactoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceFactoryName: factoryName,
    );

    final provider = FactoryProviderName(
      aggregateRootName: aggregateRootName,
      factoryName: factoryName,
      factoryNameImpl: factoryNameImpl,
    ).toFieldElement();

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        provider,
      ]);

      p0.directives.addAll([
        Directive.import('package:riverpod/riverpod.dart'),
        Directive.import(factoryName.myPath),
        Directive.import(factoryNameImpl.myPath),
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
