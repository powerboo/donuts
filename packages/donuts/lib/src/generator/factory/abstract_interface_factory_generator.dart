import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
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
    element;
    // is element class?
    late final ClassElement classElement;
    if (element.kind != ElementKind.CLASS || element is! ClassElement) {
      throw InvalidGenerationSourceError(
        "[${element.displayName}] is not ClassElement. runtimeType is [${element.runtimeType}]",
        element: element,
      );
    }
    classElement = element;

    // aggregate root does not support abstract class
    if (classElement.isAbstract) {
      throw InvalidGenerationSourceError(
        "[${element.displayName}] is abstract class.",
        element: element,
      );
    }

    ConstructorElement? constructorElement = null;
    for (final constructor in classElement.constructors) {
      if (constructor.name == "") {
        constructorElement = constructor;
        break;
      }
    }

    // does not have default constructor
    if (constructorElement == null) {
      throw InvalidGenerationSourceError(
        "[${element.displayName}] does not have default constructor.",
        element: element,
      );
    }

    // get annotated argument
    final List<ParameterElement> annotatedElementList = [];
    // final List<ParameterElement> normalArgumentList = [];
    for (final argument in constructorElement.children) {
      if (argument is! ParameterElement) {
        continue;
      }

      for (final annotation in argument.metadata) {
        if ('KeyArgument' == annotation.element?.displayName) {
          annotatedElementList.add(argument);
          break;
        }
      }
    }

    // key field does not exists.
    if (annotatedElementList.isEmpty) {
      throw InvalidGenerationSourceError(
        "[${element.displayName}] annotated field does not exists.",
        element: element,
      );
    }

    // duplicate key argument
    if (annotatedElementList.length > 1) {
      throw InvalidGenerationSourceError(
        "[${element.displayName}] KeyArgument annotation is present multiple times. Please ensure only one is used.",
        element: element,
      );
    }
    final ParameterElement annotatedElement = annotatedElementList.first;
    final String myPath = element.library.identifier;

    final abstractInterfaceFactory = Class(
      (p0) {
        // class name
        p0.abstract = true;
        p0.modifier = ClassModifier.interface;
        p0.name = "${element.name}Factory";

        // body
        final create = Method((p0) {
          p0.returns = refer('${element.name}', myPath);
          p0.name = "create";

          // ignore annotated argument
          final ignoreKeyArgumentList =
              constructorElement!.children.where((e) => e.name != annotatedElement.name).toList();

          for (final arg in ignoreKeyArgumentList) {
            if (arg is! ParameterElement) {
              continue;
            }

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
        });
        final restore = Method((p0) {
          p0.returns = refer('${element.name}', myPath);
          p0.name = "restore";
          for (final arg in constructorElement!.children) {
            if (arg is! ParameterElement) {
              continue;
            }

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
        });

        p0.methods.addAll([create, restore]);
      },
    );

    final lib = Library(((p0) {
      p0.body.add(abstractInterfaceFactory);

      p0.directives.add(Directive.import(
        myPath,
      ));
    }));

    return _formatter.format('${lib.accept(DartEmitter())}');
  }
}
