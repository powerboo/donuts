import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:built_collection/built_collection.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names/abstract_interface_repository_name.dart';
import 'package:donuts/src/generator/common/names/exception_name.dart';
import 'package:donuts/src/generator/common/names/in_memory_repository_impl_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class InMemoryRepositoryImplGenerator extends GeneratorForAnnotation<AggregateRoot> {
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

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final inMemoryRepositoryImpl = InMemoryRepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    ).toClassElement();

    final exception = ExceptionName(
      exceptionBaseName: repositoryName.myClassName,
    ).toClassElement();

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        inMemoryRepositoryImpl,
        exception,
      ]);

      p0.directives.addAll([
        Directive.import(repositoryName.myPath),
        Directive.import(aggregateRootName.myPath),
      ]);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
