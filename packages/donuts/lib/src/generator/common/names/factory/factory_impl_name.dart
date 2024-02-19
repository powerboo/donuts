import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/generator/common/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:source_gen/source_gen.dart';

class FactoryImplName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceFactoryName _abstractInterfaceFactoryName;

  FactoryImplName({
    required AbstractInterfaceFactoryName abstractInterfaceFactoryName,
    required AggregateRootName aggregateRootName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceFactoryName = abstractInterfaceFactoryName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}FactoryImpl";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/factory/",
      _aggregateRootName.baseDirectory,
      "${myClassName.toSnakeCase()}.dart",
    );
  }

  Class toClassElement() {
    return Class(((p0) {
      // class name
      p0.abstract = false;
      p0.name = myClassName;
      p0.implements = ListBuilder<Reference>([
        refer(
          _abstractInterfaceFactoryName.myClassName,
          _abstractInterfaceFactoryName.myPath,
        ),
      ]);

      switch (_aggregateRootName.keyArgumentDiv) {
        case KeyArgumentDiv.uuidV7:
          p0.fields = ListBuilder<Field>([
            Field((b) {
              b.name = 'uuid';
              b.type = refer('Uuid', 'package:uuid/uuid.dart');
              b.modifier = FieldModifier.final$;
              b.assignment = Code("Uuid()");
            }),
          ]);
          break;
        case KeyArgumentDiv.object:
          throw InvalidGenerationSourceError(
            "un implements.",
            element: _aggregateRootName.element,
          );
        default:
          throw InvalidGenerationSourceError(
            "un supported KeyArgumentDiv.",
            element: _aggregateRootName.element,
          );
      }

      // body
      final create = Method((p0) {
        p0.returns = refer(
          '${_aggregateRootName.myClassName}',
          _aggregateRootName.myPath,
        );
        p0.name = "create";

        // ignore annotated argument
        final ignoreKeyArgumentList = _aggregateRootName.constructorElement.children
            .where((e) => e.name != _aggregateRootName.keyArgumentElement.name)
            .toList();

        Map<String, String> map = {};

        // final id = uuid.v7();
        map.addAll({_aggregateRootName.keyArgumentElement.name: 'id'});

        for (final arg in ignoreKeyArgumentList) {
          if (arg is! ParameterElement) {
            continue;
          }
          map.addAll({arg.displayName: arg.displayName});
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
        switch (_aggregateRootName.keyArgumentDiv) {
          case KeyArgumentDiv.uuidV7:
            p0.body = Code('''
              final id = uuid.v7();

              return ${_aggregateRootName.myClassName}(
                ${_aggregateRootName.initArgumentString(map)}
              );
            ''');
            break;
          case KeyArgumentDiv.object:
            throw InvalidGenerationSourceError(
              "un implements.",
              element: _aggregateRootName.element,
            );
          default:
            throw InvalidGenerationSourceError(
              "un supported KeyArgumentDiv.",
              element: _aggregateRootName.element,
            );
        }
      });
      final restore = Method((p0) {
        p0.returns = refer(_aggregateRootName.myClassName, _aggregateRootName.myPath);
        p0.name = "restore";

        Map<String, String> map = {};

        for (final arg in _aggregateRootName.constructorElement.children) {
          if (arg is! ParameterElement) {
            continue;
          }

          map.addAll({arg.displayName: arg.displayName});
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
        p0.body = Code('''
              return ${_aggregateRootName.myClassName}(
                ${_aggregateRootName.initArgumentString(map)}
              );
            ''');
      });

      p0.methods.addAll([create, restore]);
    }));
  }
}
