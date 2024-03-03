import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;

class AbstractInterfaceFactoryName {
  final AggregateRootName _aggregateRootName;

  AbstractInterfaceFactoryName({
    required AggregateRootName aggregateRootName,
  }) : _aggregateRootName = aggregateRootName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}Factory";
  }

  String get myInstanceName {
    return "${myClassName[0].toLowerCase()}${myClassName.substring(1)}";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/factory/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.abstract_interface_factory.dart",
    );
  }

  Class toClassElement() {
    return Class(
      (p0) {
        // class name
        p0.abstract = true;
        p0.modifier = ClassModifier.interface;
        p0.name = myClassName;

        // body
        final create = Method((p0) {
          p0.returns = refer(
            _aggregateRootName.myClassName,
            _aggregateRootName.myPath,
          );
          p0.name = "create";
          // ignore annotated argument
          final ignoreKeyArgumentList = _aggregateRootName
              .constructorElement.children
              .where(
                  (e) => e.name != _aggregateRootName.keyArgumentElement.name)
              .toList();

          for (final arg in ignoreKeyArgumentList) {
            if (arg is! ParameterElement) {
              continue;
            }
            if (arg.isPositional) {
              p0.requiredParameters.add(Parameter((p0) {
                p0.name = arg.name;
                p0.type = Reference(
                  arg.type.getDisplayString(withNullability: true),
                  arg.library?.identifier,
                );
                p0.named = false;
                p0.required = false;
              }));
            } else {
              p0.optionalParameters.add(Parameter((p0) {
                p0.name = arg.name;
                p0.type = Reference(
                  arg.type.getDisplayString(withNullability: true),
                  arg.library?.identifier,
                );
                p0.named = true;
                p0.required = arg.isRequired;
              }));
            }
          }
        });
        final restore = Method((p0) {
          p0.returns = refer(
            _aggregateRootName.myClassName,
            _aggregateRootName.myPath,
          );
          p0.name = "restore";
          for (final arg in _aggregateRootName.constructorElement.children) {
            if (arg is! ParameterElement) {
              continue;
            }

            if (arg.isPositional) {
              p0.requiredParameters.add(Parameter((p0) {
                p0.name = arg.name;
                p0.type = Reference(
                  arg.type.getDisplayString(withNullability: true),
                  arg.library?.identifier,
                );
                p0.named = false;
                p0.required = false;
              }));
            } else {
              p0.optionalParameters.add(Parameter((p0) {
                p0.name = arg.name;
                p0.type = Reference(
                  arg.type.getDisplayString(withNullability: true),
                  arg.library?.identifier,
                );
                p0.named = true;
                p0.required = arg.isRequired;
              }));
            }
          }
        });

        p0.methods.addAll([create, restore]);
      },
    );
  }
}
