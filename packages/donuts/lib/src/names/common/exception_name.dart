import 'package:code_builder/code_builder.dart';

class ExceptionName {
  final String exceptionBaseName;

  ExceptionName({
    required this.exceptionBaseName,
  });

  String get myClassName {
    return "${exceptionBaseName}Exception";
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.implements.add(refer('Exception'));
      p0.constructors.add(Constructor((p1) {
        p1.requiredParameters.add(Parameter((p2) {
          p2.name = 'message';
          p2.type = refer('String');
        }));
        p1.initializers.add(Code('message = "[${myClassName}]\$message"'));
        p1.constant = true;
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
