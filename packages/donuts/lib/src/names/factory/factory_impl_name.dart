import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;

class FactoryImplName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceFactoryName _abstractInterfaceFactoryName;
  final ExceptionName _exceptionName;

  FactoryImplName({
    required AbstractInterfaceFactoryName abstractInterfaceFactoryName,
    required AggregateRootName aggregateRootName,
    required ExceptionName exceptionName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceFactoryName = abstractInterfaceFactoryName,
        _exceptionName = exceptionName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}FactoryImpl";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/factory/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.factory_impl.dart",
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
      if (!(_aggregateRootName.keyFactoryName == null ||
          _aggregateRootName.keyType == "String")) {
        p0.constructors.add(Constructor((ct) {
          ct.optionalParameters.add(Parameter((p0) {
            p0.name = 'keyFactory';
            p0.type = refer('KeyFactory',
                'package:donuts_annotation/donuts_annotation.dart');
            p0.required = true;
            p0.named = true;
            p0.toThis = true;
          }));
        }));
        p0.fields.add(Field((b) {
          b.name = 'keyFactory';
          b.type = refer(
              'KeyFactory', 'package:donuts_annotation/donuts_annotation.dart');
          b.modifier = FieldModifier.final$;
        }));
      }

      if (_aggregateRootName.keyType == "String" &&
          !_aggregateRootName.isInterface) {
        p0.fields.add(Field((b) {
          b.name = 'uuid';
          b.type = refer('Uuid', 'package:uuid/uuid.dart');
          b.modifier = FieldModifier.final$;
          b.assignment = Code("const Uuid()");
        }));
      }

      // body
      final create = Method((p0) {
        p0.returns = refer(
          '${_aggregateRootName.myClassName}',
          _aggregateRootName.myPath,
        );
        p0.name = "create";
        p0.annotations.add(
          refer('override'),
        );
        // ignore annotated argument
        final ignoreKeyArgumentList = _aggregateRootName
            .constructorElement.children
            .where((e) => e.name != _aggregateRootName.keyArgumentElement.name)
            .toList();

        Map<String, String> map = {};

        map.addAll({_aggregateRootName.keyArgumentElement.name: 'key'});
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

        if (_aggregateRootName.isInterface) {
          p0.body = Code(
              "throw ${_exceptionName.myClassName}(\"[${_aggregateRootName.myClassName}] is interface or abstract.must be implement custom factory.Please check Section XXX in https://pub.dev/packages/donuts\");");
        } else {
          p0.body = Code('''
              final key = ${_aggregateRootName.keyInitializer()};

              return ${_aggregateRootName.myClassName}(
                ${_aggregateRootName.initArgumentString(arg: map)}
              );
            ''');
        }
      });
      final restore = Method((p0) {
        p0.returns =
            refer(_aggregateRootName.myClassName, _aggregateRootName.myPath);
        p0.name = "restore";
        p0.annotations.add(
          refer('override'),
        );
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
        if (_aggregateRootName.isInterface) {
          p0.body = Code(
              "throw ${_exceptionName.myClassName}(\"[${_aggregateRootName.myClassName}] is interface or abstract.must be implement custom factory.Please check Section XXX in https://pub.dev/packages/donuts\");");
        } else {
          p0.body = Code('''
              return ${_aggregateRootName.myClassName}(
                ${_aggregateRootName.initArgumentString(arg: map)}
              );
            ''');
        }
      });

      p0.methods.addAll([create, restore]);
    }));
  }
}
