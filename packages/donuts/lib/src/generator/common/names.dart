import 'package:analyzer/dart/element/element.dart';
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

class Names {
  late final LibraryElement _libraryElement;
  final Element element;

  Names(
    this.element,
  ) {
    final lib = element.library;
    if (lib == null) {
      throw InvalidGenerationSourceError(
        "[ImportPathProvider] library is null.",
        element: element,
      );
    }
    _libraryElement = lib;
  }

  String get aggregateRootClassName {
    return element.displayName;
  }

  String get abstractInterfaceFactoryName {
    return "${element.displayName}Factory";
  }

  String get factoryImplName {
    return "${element.displayName}FactoryImpl";
  }

  String? get packageName {
    return _libraryElement.source.uri.pathSegments.firstOrNull;
  }

  /// myPath : package:example_pj/sample_model/child_model/aggregate_root/sample.dart
  String get aggregateRootPath {
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

  String get abstractInterfaceFactoryPath {
    return p.join(
      "package:${packageName}/donuts/factory/",
      baseDirectory,
      "abstract_interface_${aggregateRootClassName.toSnakeCase()}.dart",
    );
  }
}

class ImportPathProviderException implements Exception {
  late final String message;
  ImportPathProviderException(final String message) {
    this.message = "[ImportPathProviderException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
