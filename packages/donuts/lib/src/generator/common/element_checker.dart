import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

Future<
    (
      ConstructorElement constructorElement,
      ParameterElement annotatedElement,
    )> elementChecker(
  Element element,
  ConstantReader annotation,
  BuildStep buildStep,
) async {
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

  // parent directory is not aggregate_root
  final fullPath = element.library.source.fullName;
  final parentDir = p.basename(p.dirname(fullPath));
  if (parentDir != "aggregate_root") {
    throw InvalidGenerationSourceError(
      "[${element.displayName}] parent directory is not aggregate_root.",
      element: element,
    );
  }

  return (
    constructorElement,
    annotatedElement,
  );
}

extension KebabCase on String {
  String toKebabCase() {
    final regExp = RegExp(r'(?<=[a-z])[A-Z]');
    return replaceAllMapped(regExp, (Match match) => '-${match.group(0)!.toLowerCase()}').toLowerCase();
  }

  String toSnakeCase() {
    final regExp = RegExp(r'(?<=[a-z])[A-Z]');
    return replaceAllMapped(regExp, (Match match) => '_${match.group(0)!.toLowerCase()}').toLowerCase();
  }
}
