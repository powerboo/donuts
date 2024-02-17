import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';

class ExceptionName {
  final Element _element;

  ExceptionName({
    required Element element,
  }) : _element = element;

  String get myClassName {
    return "${_element.displayName}Exception";
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.implements.add(refer('Exception'));
      p0.constructors.add(Constructor((p1) {
        p1.requiredParameters.add(Parameter((p2) {
          p2.name = 'message';
          p2.toThis = true;
        }));
        p1.initializers.add(Code('this.message = "[${myClassName}] \$message"'));
      }));
      p0.fields.add(Field((p1) {
        p1.name = "message";
        p1.type = refer("String");
        p1.modifier = FieldModifier.final$;
      }));
      p0.methods.add(Method((p1) {
        p1.name = 'toString';
        p1.returns = refer('String');
        p1.body = Code('return message;');
        p1.annotations.add(
          CodeExpression(Code('override')),
        );
      }));
    });
  }
}
