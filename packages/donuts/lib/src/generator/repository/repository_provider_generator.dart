import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:built_collection/built_collection.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/generator/common/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/generator/common/names/repository/repository_impl_name.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class RepositoryProviderGenerator extends GeneratorForAnnotation<AggregateRoot> {
  final Map<String, dynamic> config;
  RepositoryProviderGenerator(this.config);
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

    final aggregateRootName = await elementChecker(element, annotation, buildStep);

    final repositoryName = AbstractInterfaceRepositoryName(
      aggregateRootName: aggregateRootName,
    );

    final repositoryImplName = RepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final inMemoryRepositoryImpl = InMemoryRepositoryImplName(
      aggregateRootName: aggregateRootName,
      abstractInterfaceRepositoryName: repositoryName,
    );

    final provider = Field((p0) {
      p0.name = "${repositoryName.myInstanceName}Provider";
      p0.modifier = FieldModifier.final$;
      p0.assignment = Code('''
Provider<${repositoryName.myClassName}>((ref) {
  const bool inMemory = ${inMemory.toString()};
  if(inMemory){
    return ${inMemoryRepositoryImpl.myClassName}(store: []);
  }
  return ${repositoryImplName.myClassName}();
})
''');
    });

    final lib = Library(((p0) {
      p0.body = ListBuilder<Spec>([
        provider,
      ]);

      p0.directives.addAll([
        Directive.import('package:flutter_riverpod/flutter_riverpod.dart'),
        Directive.import(repositoryName.myPath),
        Directive.import(repositoryImplName.myPath),
      ]);
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
