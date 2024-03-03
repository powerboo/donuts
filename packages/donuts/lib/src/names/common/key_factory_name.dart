import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class KeyFactoryName {
  late final ClassElement _element;

  KeyFactoryName({
    required DartObject keyFactory,
  }) {
    final typeValue = keyFactory.type;
    if (typeValue == null) {
      throw InvalidGenerationSourceError(
        "[KeyFactoryName] keyFactory is null.",
        element: null,
      );
    }

    final element = typeValue.element;

    if (element == null) {
      throw InvalidGenerationSourceError(
        "[KeyFactoryName] element is null.",
        element: null,
      );
    }

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        "[KeyFactoryName] element is not ClassElement.",
        element: null,
      );
    }
    _element = element;
  }

  String get myPath {
    return _element.library.identifier;
  }

  String initializer() {
    return "${_element.name}();";
  }
}
