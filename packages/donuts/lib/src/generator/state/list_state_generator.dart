import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:built_collection/built_collection.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names/state/list_state_impl_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class ListStateGenerator extends GeneratorForAnnotation<AggregateRoot> {
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

    final listStateImpl = ListStateImplName(
      aggregateRootName: aggregateRootName,
    ).toClassElement();

    final provider = Field((f) {
      f.name = "${aggregateRootName.myInstanceName}Provider";
      f.modifier = FieldModifier.final$;
      f.assignment = Code('''
AsyncNotifierProvider<${aggregateRootName.myClassName}AsyncNotifier, List<${aggregateRootName.myClassName}>>(${aggregateRootName.myClassName}AsyncNotifier.new)
''');
    });

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        provider,
        listStateImpl,
      ]);

      p0.directives.addAll([
        // Directive.import("package:donuts_annotation/error_message.dart"),
        Directive.import("package:flutter_riverpod/flutter_riverpod.dart"),
        Directive.import(aggregateRootName.myPath),
      ]);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
