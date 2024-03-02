import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:donuts/src/generator/common/names/common/key_factory_name.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

class AggregateRootName {
  final ClassElement element;
  late final LibraryElement _libraryElement;
  final ParameterElement keyArgumentElement;
  final ConstructorElement constructorElement;
  final ElementAnnotation annotation;
  KeyFactoryName? _keyFactoryName = null;
  late final String keyType;

  AggregateRootName({
    required this.element,
    required this.keyArgumentElement,
    required this.constructorElement,
    required this.annotation,
  }) : _libraryElement = element.library {
    final value = annotation.computeConstantValue();
    if (value == null) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] annotation.computeConstantValue is null.",
        element: element,
      );
    }
    final keyFactoryValue = value.getField("keyFactory");

    // key only use String(UUID) or factory
    keyType = keyArgumentElement.type.getDisplayString(withNullability: false);

    if ((keyFactoryValue == null || keyFactoryValue.isNull) &&
        keyType != "String") {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] key type is [${keyType}].But keyFactory is null.must be set keyFactory.Please check Section YYY together in https://pub.dev/packages/donuts.",
        element: element,
      );
    }

    _keyFactoryName = KeyFactoryName(
      keyFactory: keyFactoryValue!,
    );
  }

  KeyFactoryName? get keyFactoryName {
    return _keyFactoryName;
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

  String get fileName {
    return p.basenameWithoutExtension(_libraryElement.source.uri.path);
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

  bool get isInterface {
    return element.isInterface || element.isAbstract;
  }

  String keyInitializer() {
    if (keyType == "String") {
      return "uuid.v7()";
    }

    return "keyFactory.create()";
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
  String initArgumentString({
    Map<String, String> arg = const {},
    bool ignoreKey = false,
  }) {
    final Map<String, String> augmentList = {};
    if (arg.isEmpty) {
      for (final augment in constructorElement.children) {
        augmentList.addAll({augment.displayName: augment.displayName});
      }
    } else {
      augmentList.addAll(arg);
    }
    // sampleFunc(int a, String b);
    final List<ParameterElement> requiredParam = [];

    // sampleFunc({int a = 1,required String b});
    final List<ParameterElement> namedParam = [];

    // Distribute arguments to the appropriate lists
    for (final param in constructorElement.children) {
      if (param is! ParameterElement) {
        continue;
      }
      if (ignoreKey &&
          param.metadata.any((annotation) =>
              annotation.element?.displayName == 'KeyArgument')) {
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
    for (final p in namedParam) {
      if (!augmentList.containsKey(p.displayName)) {
        continue;
      }
      final value = augmentList[p.displayName];
      buffer.write("${p.displayName}:${value},");
    }
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
        .where((segment) => segment != pathSegments.last)
        .toList();
    return p.joinAll(filteredSegments);
  }
}
