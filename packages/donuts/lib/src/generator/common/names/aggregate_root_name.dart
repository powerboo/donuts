import 'package:analyzer/dart/element/element.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

class AggregateRootName {
  final Element element;
  late final LibraryElement _libraryElement;
  final ParameterElement keyArgumentElement;
  final ConstructorElement constructorElement;
  final ElementAnnotation annotation;

  AggregateRootName({
    required this.element,
    required this.keyArgumentElement,
    required this.constructorElement,
    required this.annotation,
  }) {
    final lib = element.library;
    if (lib == null) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] library is null.",
        element: element,
      );
    }
    _libraryElement = lib;
  }

  String get packageName {
    if (_libraryElement.source.uri.pathSegments.isEmpty) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] pathSegments is empty.",
        element: element,
      );
    }
    return _libraryElement.source.uri.pathSegments.first;
  }

  KeyArgumentDiv get keyArgumentDiv {
    final value = annotation.computeConstantValue();
    if (value == null) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] annotation.computeConstantValue is null.",
        element: element,
      );
    }
    final div = value.getField("keyArgumentDiv");
    if (div == null) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] keyArgumentDiv is null.",
        element: element,
      );
    }
    final d = div.variable?.displayName;
    if (d == null) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] keyArgumentDiv is not String.",
        element: element,
      );
    }
    return KeyArgumentDiv.from(value: d);
  }

  String get myClassName {
    return element.displayName;
  }

  String get myInstanceName {
    return "${element.displayName[0].toLowerCase()}${element.displayName.substring(1)}";
  }

  String get keyClassName {
    return keyArgumentElement.type.getDisplayString(withNullability: true);
  }

  String get keyInstanceName {
    return "${keyArgumentElement.displayName[0].toLowerCase()}${keyArgumentElement.displayName.substring(1)}";
  }

  /// ```dart
  /// class Sample{
  ///   Sample(
  ///     String a, {
  ///       required int b,
  ///     });
  /// }
  /// final val = Sample(
  ///  arg.a, {     //
  ///    b: arg.b,  // generate
  ///  }            //
  /// );
  /// ```
  String initArgumentString(Map<String, String> arg) {
    // sampleFunc(int a, String b);
    final List<ParameterElement> requiredParam = [];

    // sampleFunc({int a = 1,required String b});
    final List<ParameterElement> namedParam = [];

    // Distribute arguments to the appropriate lists
    for (final param in constructorElement.children) {
      if (param is! ParameterElement) {
        continue;
      }
      if (param.isNamed) {
        namedParam.add(param);
      } else {
        requiredParam.add(param);
      }
    }

    final StringBuffer buffer = StringBuffer();
    for (final p in requiredParam) {
      buffer.write("${p.displayName},");
    }
    buffer.write("{");
    for (final p in namedParam) {
      if (!arg.containsKey(p.displayName)) {
        continue;
      }
      final value = arg[p.displayName];
      buffer.write("${p.displayName}:${value},");
    }
    buffer.write("}");
    return buffer.toString();
  }

  /// myPath : package:example_pj/sample_model/child_model/aggregate_root/sample.dart
  String get myPath {
    return _libraryElement.identifier;
  }

  /// myPath : package:example_pj/sample_model/child_model/aggregate_root/sample.dart
  /// baseDirectory : sample_model/child_model
  String get baseDirectory {
    final pathSegments = _libraryElement.source.uri.pathSegments;
    final filteredSegments = pathSegments
        .skip(1)
        .where((segment) => segment != pathSegments.last && segment != "aggregate_root")
        .toList();
    return p.joinAll(filteredSegments);
  }
}
