import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();

class AbstractInterfaceFactoryGenerator extends GeneratorForAnnotation<AggregateRoot> {
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

    final className = "${element.name}Factory";

    final abstractInterfaceFactory = Class(
      (p0) {
        // class name
        p0.abstract = true;
        p0.modifier = ClassModifier.interface;
        p0.name = className;

        // body
        final create = Method((p0) {
          p0.returns = refer('${element.name}', myPath);
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
        });
        final restore = Method((p0) {
          p0.returns = refer('${element.name}', myPath);
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
        });

        p0.methods.addAll([create, restore]);
      },
    );

    final lib = Library(((p0) {
      p0.body.add(abstractInterfaceFactory);

      p0.directives.add(
        Directive.import(myPath),
      );
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
