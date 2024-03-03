import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/application_service/abstract_interface_application_service_name.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:donuts/src/names/common/exception_name.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';

class ApplicationServiceImplName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceRepositoryName _abstractInterfaceRepositoryName;
  final AbstractInterfaceFactoryName _abstractInterfaceFactoryName;
  final ExceptionName _exceptionName;
  final AbstractInterfaceApplicationServiceName
      _abstractInterfaceApplicationServiceName;

  ApplicationServiceImplName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
    required AbstractInterfaceFactoryName abstractInterfaceFactoryName,
    required ExceptionName exceptionName,
    required AbstractInterfaceApplicationServiceName
        abstractInterfaceApplicationServiceName,
  })  : _aggregateRootName = aggregateRootName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName,
        _abstractInterfaceFactoryName = abstractInterfaceFactoryName,
        _exceptionName = exceptionName,
        _abstractInterfaceApplicationServiceName =
            abstractInterfaceApplicationServiceName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}ApplicationServiceImpl";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/application_service/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.application_service_impl.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.implements.add(refer(
          _abstractInterfaceApplicationServiceName.myClassName,
          _abstractInterfaceApplicationServiceName.myPath));

      p0.constructors.add(Constructor((ct) {
        ct.optionalParameters.add(Parameter((p1) {
          p1.name = _abstractInterfaceFactoryName.myInstanceName;
          p1.named = true;
          p1.required = true;
          p1.type = refer(
            _abstractInterfaceFactoryName.myClassName,
            _abstractInterfaceFactoryName.myPath,
          );
        }));
        ct.optionalParameters.add(Parameter((p1) {
          p1.name = _abstractInterfaceRepositoryName.myInstanceName;
          p1.named = true;
          p1.required = true;
          p1.type = refer(
            _abstractInterfaceRepositoryName.myClassName,
            _abstractInterfaceRepositoryName.myPath,
          );
        }));

        ct.initializers.addAll([
          Code(
              "_${_abstractInterfaceFactoryName.myInstanceName} = ${_abstractInterfaceFactoryName.myInstanceName}"),
          Code(
              "_${_abstractInterfaceRepositoryName.myInstanceName} = ${_abstractInterfaceRepositoryName.myInstanceName}"),
        ]);
      }));

      final factory = Field((p0) {
        p0.name = '_${_abstractInterfaceFactoryName.myInstanceName}';
        p0.type = refer(
          _abstractInterfaceFactoryName.myClassName,
          _abstractInterfaceFactoryName.myPath,
        );
        p0.modifier = FieldModifier.final$;
      });

      final repository = Field((p0) {
        p0.name = '_${_abstractInterfaceRepositoryName.myInstanceName}';
        p0.type = refer(
          _abstractInterfaceRepositoryName.myClassName,
          _abstractInterfaceRepositoryName.myPath,
        );
        p0.modifier = FieldModifier.final$;
      });

      p0.name = myClassName;
      p0.abstract = false;

      p0.fields.addAll([
        factory,
        repository,
      ]);

      final create = Method((p0) {
        p0.modifier = MethodModifier.async;
        p0.returns =
            refer('Future<(${_aggregateRootName.myClassName}?, DonutsError?)>');
        p0.name = 'create';
        p0.annotations.add(
          refer('override'),
        );

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

        p0.body = Code('''
try{
  final created = _${_abstractInterfaceFactoryName.myInstanceName}.create(${_aggregateRootName.initArgumentString(ignoreKey: true)});
  await _${_abstractInterfaceRepositoryName.myInstanceName}.save(${_aggregateRootName.myInstanceName}: created);
  return (created, null);
} catch(e, stacktrace){
  return (null, DonutsError(e, stacktrace));
}
''');
      });

      final find = Method((p0) {
        p0.annotations.add(
          refer('override'),
        );

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
        p0.body = Code('''
try {
  final target = await _${_abstractInterfaceRepositoryName.myInstanceName}.find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
  return (target, null);
} catch (e, stacktrace) {
  return (null, DonutsError(e, stacktrace));
}
''');
      });

      final save = Method((p0) {
        p0.annotations.add(
          refer('override'),
        );

        p0.modifier = MethodModifier.async;
        p0.returns = refer('Future<(void, DonutsError?)>');
        p0.name = 'save';
        p0.optionalParameters.add(Parameter((p1) {
          p1.name = _aggregateRootName.myInstanceName;
          p1.type = refer(_aggregateRootName.myClassName);
          p1.named = true;
          p1.required = true;
        }));
        p0.body = Code('''
try {
  await _${_abstractInterfaceRepositoryName.myInstanceName}.save(${_aggregateRootName.myInstanceName}: ${_aggregateRootName.myInstanceName});
  return (null, null);
} catch (e, stacktrace) {
  return (null, DonutsError(e, stacktrace));
}
''');
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
        p0.body = Code('''
try {
  await _${_abstractInterfaceRepositoryName.myInstanceName}.delete(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
  return (null, null);
} catch (e, stacktrace) {
  return (null, DonutsError(e, stacktrace));
}
''');
      });

      final all = Method((p0) {
        p0.annotations.add(
          refer('override'),
        );

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
        p0.body = Code('''
try {
  final target = await _${_abstractInterfaceRepositoryName.myInstanceName}.all(cursor: cursor, length: length);
  return (target, null);
} catch (e, stacktrace) {
  return (null, DonutsError(e, stacktrace));
}
''');
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
          p0.annotations.add(
            refer('override'),
          );

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
          /*
          if (method.returnType.isDartAsyncFuture ||
              method.returnType.isDartAsyncFutureOr ||
              method.returnType.isDartAsyncStream) {
            m.returns = refer(
                'Future<(${method.returnType.getDisplayString(withNullability: false)}?, ErrorMessage?)>');
          } else if (method.returnType is VoidType) {
            m.returns = refer('Future<(void, ErrorMessage?)>');
          } else {
            m.returns = refer(
                'Future<(${method.returnType.getDisplayString(withNullability: false)}?, ErrorMessage?)>');
          }
          // */

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

          if (doc == null) {
            // body
            m.body = Code('''
try {
  final target = await _${_abstractInterfaceRepositoryName.myInstanceName}.find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
  if(target == null){
    throw ${_exceptionName.myClassName}("[${method.name}]target is null.\${${_aggregateRootName.keyInstanceName}}");
  }

  final changed = target.${method.name}(${_aggregateRootName.methodArguments(method.name)});

  await _${_abstractInterfaceRepositoryName.myInstanceName}.save(${_aggregateRootName.myInstanceName}: changed);
  return (changed, null);
} catch (e, stacktrace) {
  return (null, DonutsError(e, stacktrace));
}
''');
          } else {
            // body
            m.body = Code('''
try {
  final target = await _${_abstractInterfaceRepositoryName.myInstanceName}.find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
  if(target == null){
    throw ${_exceptionName.myClassName}("[${method.name}]target is null.\${${_aggregateRootName.keyInstanceName}}");
  }

  // ${doc.substring(3).trimLeft()}
  final changed = target.${method.name}(${_aggregateRootName.methodArguments(method.name)});

  await _${_abstractInterfaceRepositoryName.myInstanceName}.save(${_aggregateRootName.myInstanceName}: changed);
  return (changed, null);
} catch (e, stacktrace) {
  return (null, DonutsError(e, stacktrace));
}
''');
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
