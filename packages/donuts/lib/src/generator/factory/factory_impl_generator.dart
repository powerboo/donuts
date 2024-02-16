import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/generator/common/names.dart';
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
    final library = element.library;

    if (library == null) {
      throw InvalidGenerationSourceError(
        "library is null",
        element: element,
      );
    }

    final (
      constructorElement,
      annotatedElement,
    ) = await elementChecker(element, annotation, buildStep);

    final names = Names(element);

    final factoryImpl = Class(((p0) {
      // class name
      p0.abstract = false;
      p0.name = names.factoryImplName;
      p0.implements = ListBuilder<Reference>([
        refer('${element.name}Factory', names.abstractInterfaceFactoryPath),
      ]);

      p0.fields = ListBuilder<Field>([
        Field((b) {
          b.name = 'uuid';
          b.type = refer('Uuid', 'package:uuid/uuid.dart');
          b.modifier = FieldModifier.final$;
          b.assignment = Code("Uuid()");
        }),
      ]);

      // body
      final create = Method((p0) {
        p0.returns = refer('${element.name}', names.aggregateRootPath);
        p0.name = "create";

        // ignore annotated argument
        final ignoreKeyArgumentList =
            constructorElement.children.where((e) => e.name != annotatedElement.name).toList();
        for (final arg in ignoreKeyArgumentList) {
          if (arg is! ParameterElement) {
            continue;
          }
          if (arg.isPositional) {
            p0.requiredParameters.add(Parameter((p0) {
              p0.name = arg.name;
              p0.type = Reference(
                arg.type.getDisplayString(withNullability: true),
                arg.library?.identifier,
              );
              p0.named = false;
              p0.required = false;
            }));
          } else {
            p0.optionalParameters.add(Parameter((p0) {
              p0.name = arg.name;
              p0.type = Reference(
                arg.type.getDisplayString(withNullability: true),
                arg.library?.identifier,
              );
              p0.named = true;
              p0.required = arg.isRequired;
            }));
          }
        }

        p0.body = Code('''
    final key = uuid.v7();

    return ParentDirIsAggregateRootClass(
      value,
      nullableValue, {
      key: key,
      name: name,
    });
''');
      });
      final restore = Method((p0) {
        p0.returns = refer('${element.name}', names.aggregateRootPath);
        p0.name = "restore";
        for (final arg in constructorElement.children) {
          if (arg is! ParameterElement) {
            continue;
          }

          if (arg.isPositional) {
            p0.requiredParameters.add(Parameter((p0) {
              p0.name = arg.name;
              p0.type = Reference(
                arg.type.getDisplayString(withNullability: true),
                arg.library?.identifier,
              );
              p0.named = false;
              p0.required = false;
            }));
          } else {
            p0.optionalParameters.add(Parameter((p0) {
              p0.name = arg.name;
              p0.type = Reference(
                arg.type.getDisplayString(withNullability: true),
                arg.library?.identifier,
              );
              p0.named = true;
              p0.required = arg.isRequired;
            }));
          }
        }

        p0.body = Code('''
    return ParentDirIsAggregateRootClass(
      value,
      nullableValue, {
      key: key,
      name: name,
    });
''');
      });

      p0.methods.addAll([create, restore]);
    }));

    final lib = Library(((p0) {
      p0.body.add(factoryImpl);

      p0.directives.add(
        Directive.import(names.aggregateRootPath),
      );
      p0.directives.add(
        Directive.import(names.abstractInterfaceFactoryPath),
      );

      p0.directives.add(Directive.import("package:uuid/uuid.dart"));
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
