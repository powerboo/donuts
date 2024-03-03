import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';

class AbstractInterfaceApplicationServiceName {
  final AggregateRootName _aggregateRootName;

  AbstractInterfaceApplicationServiceName({
    required AggregateRootName aggregateRootName,
  }) : _aggregateRootName = aggregateRootName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}ApplicationService";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/application_service/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.abstract_interface_application_service.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.abstract = true;
      p0.modifier = ClassModifier.interface;

      final create = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns =
            refer('Future<(${_aggregateRootName.myClassName}?, DonutsError?)>');
        p0.name = 'create';

        for (final argument in _aggregateRootName.constructorElement.children) {
          if (argument is! ParameterElement) {
            continue;
          }
          if (argument.metadata.any((annotation) =>
              annotation.element?.displayName == 'KeyArgument')) {
            continue;
          }

          if (argument.isNamed) {
            p0.optionalParameters.add(Parameter((p1) {
              p1.name = argument.displayName;
              p1.type =
                  refer(argument.type.getDisplayString(withNullability: true));
              p1.named = true;
              p1.required = argument.isRequired;
            }));
          } else {
            p0.requiredParameters.add(Parameter((p1) {
              p1.name = argument.displayName;
              p1.type =
                  refer(argument.type.getDisplayString(withNullability: true));
              p1.named = false;
              p1.required = false;
            }));
          }
        }
      });

      final find = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns =
            refer('Future<(${_aggregateRootName.myClassName}?, DonutsError?)>');
        p0.name = 'find';
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.keyInstanceName;
          p1.type = refer(
            _aggregateRootName.keyClassName,
            _aggregateRootName.myPath,
          );
          p1.named = true;
          p1.required = true;
        }));
      });

      final save = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<(void, DonutsError?)>');
        p0.name = 'save';
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.myInstanceName;
          p1.type = refer(_aggregateRootName.myClassName);
          p1.named = true;
          p1.required = true;
        }));
      });

      final delete = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<(void, DonutsError?)>');
        p0.name = 'delete';
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.keyInstanceName;
          p1.type = refer(_aggregateRootName.keyClassName);
          p1.named = true;
          p1.required = true;
        }));
      });

      final all = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns = refer(
            'Future<(List<${_aggregateRootName.myClassName}>?, DonutsError?)>');
        p0.name = 'all';
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = 'cursor';
          p1.type = refer('int');
          p1.defaultTo = Code('0');
          p1.named = true;
          p1.required = false;
        }));
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = 'length';
          p1.type = refer('int');
          p1.defaultTo = Code('100');
          p1.named = true;
          p1.required = false;
        }));
      });

      // aggregate method
      final List<Method> methodList = [];
      for (final method in _aggregateRootName.element.methods) {
        if (method.name == "toString") {
          continue;
        }

        // annotated IgnoreMethod
        if (method.metadata.any((annotation) =>
            annotation.element?.displayName == 'IgnoreMethod')) {
          continue;
        }

        methodList.add(Method((m) {
          // method
          m.name = method.name;
          m.modifier = MethodModifier.async;

          // key argument always required named
          m.optionalParameters.add(Parameter((p1) {
            p1.name = _aggregateRootName.keyInstanceName;
            p1.type = refer(_aggregateRootName.keyClassName);
            p1.named = true;
            p1.required = true;
          }));

          // doc
          final doc = method.documentationComment;
          if (doc != null) {
            m.docs.add(doc);
          }

          // return
          m.returns = refer(
              'Future<(${_aggregateRootName.myClassName}?, DonutsError?)>');
          if (method.returnType.getDisplayString(withNullability: false) !=
                  _aggregateRootName.myClassName &&
              method.name != "toString") {
            throw InvalidGenerationSourceError(
                "The return type must be [${_aggregateRootName.myClassName}].method name [${method.name}]");
          }

          // parameter
          for (final parameter in method.parameters) {
            if (parameter.isPositional) {
              m.requiredParameters.add(Parameter((p) {
                p.type = refer(
                    parameter.type.getDisplayString(withNullability: true));
                p.name = parameter.name;
                p.named = false;
                p.required = false;
              }));
            } else {
              m.optionalParameters.add(Parameter((p) {
                p.type = refer(
                    parameter.type.getDisplayString(withNullability: true));
                p.name = parameter.name;
                p.named = true;
                p.required = parameter.isRequired;
              }));
            }
          }
        }));
      }

      p0.methods = ListBuilder([
        create,
        find,
        save,
        delete,
        all,
        ...methodList,
      ]);
    });
  }
}
