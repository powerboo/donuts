import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:source_gen/source_gen.dart';

Future<AggregateRootName> elementChecker(
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
  ElementAnnotation? keyFieldAnnotation;
  DartObject aggregateRootAnnotation = annotation.objectValue;

  for (final argument in constructorElement.children) {
    if (argument is! ParameterElement) {
      continue;
    }

    for (final a in argument.metadata) {
      if ('KeyArgument' == a.element?.displayName) {
        annotatedElementList.add(argument);
        keyFieldAnnotation = a;
        break;
      }
    }
  }

  // key field does not exists.
  if (annotatedElementList.isEmpty || keyFieldAnnotation == null) {
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

  // key field target
  // - field
  // - getter
  // - constructor arguments

  bool hasPublicEquivalent = false;
  for (final field in classElement.fields) {
    if (!field.isPrivate && annotatedElement.displayName == field.name) {
      hasPublicEquivalent = true;
      break;
    }
  }

  if (!hasPublicEquivalent) {
    final getter = classElement.lookUpGetter(
        "${annotatedElement.displayName}", classElement.library);
    if (getter != null) {
      hasPublicEquivalent = !getter.isPrivate;
    }
  }

  if (!hasPublicEquivalent) {
    throw InvalidGenerationSourceError(
      "[${element.displayName}] does not have a public field equivalent to the key field. Please check ZZZZ section in https://pub.dev/packages/donuts.",
      element: element,
    );
  }

  return AggregateRootName(
    element: element,
    keyArgumentElement: annotatedElement,
    constructorElement: constructorElement,
    keyFieldAnnotation: keyFieldAnnotation,
    aggregateRootAnnotation: aggregateRootAnnotation,
  );
}

extension KebabCase on String {
  String toKebabCase() {
    final regExp = RegExp(r'(?<=[a-z])[A-Z]');
    return replaceAllMapped(
            regExp, (Match match) => '-${match.group(0)!.toLowerCase()}')
        .toLowerCase();
  }

  String toSnakeCase() {
    final regExp = RegExp(r'(?<=[a-z])[A-Z]');
    return replaceAllMapped(
            regExp, (Match match) => '_${match.group(0)!.toLowerCase()}')
        .toLowerCase();
  }
}
