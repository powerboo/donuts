import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class ConverterName {
  final ClassElement _converterElement;

  ConverterName({
    required ClassElement aggregateRootElement,
    required ClassElement converterElement,
  }) : _converterElement = converterElement {
    // Check if converterElement implements AggregateRootJsonConverter and if AggregateRootType equals element.displayName
    final isCorrectConverterImplemented =
        converterElement.allSupertypes.any((type) {
      return type.getDisplayString(withNullability: false) ==
          "AggregateRootJsonConverter<${aggregateRootElement.displayName}>";
    });

    if (!isCorrectConverterImplemented) {
      throw InvalidGenerationSourceError(
        "[AggregateRootName] converter element is not correct Converter. It must implement AggregateRootJsonConverter<${aggregateRootElement.displayName}>. Please check Section YYY together in https://pub.dev/packages/donuts.",
        element: aggregateRootElement,
      );
    }
  }

  String get myClassName {
    return "${_converterElement.name}";
  }

  String get myInstanceName {
    return "${_converterElement.name[0].toLowerCase() + _converterElement.name.substring(1)}";
  }

  String get myPath {
    return _converterElement.library.identifier;
  }

  String toJson() {
    return "converter.toJson()";
  }

  String fromJson({String? arg = null}) {
    if (arg == null) {
      return "converter.fromJson";
    }
    return "converter.fromJson($arg)";
  }
}
