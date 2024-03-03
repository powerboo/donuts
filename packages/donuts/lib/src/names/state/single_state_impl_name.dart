import 'package:donuts/src/names/application_service/application_service_provider_name.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;

class SingleStateImplName {
  final AggregateRootName _aggregateRootName;
  final ApplicationServiceProviderName _applicationServiceProviderName;

  SingleStateImplName({
    required AggregateRootName aggregateRootName,
    required ApplicationServiceProviderName applicationServiceProviderName,
  })  : _aggregateRootName = aggregateRootName,
        _applicationServiceProviderName = applicationServiceProviderName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}SingleStateImpl";
  }

  String get myInstanceName {
    return "${_aggregateRootName.myInstanceName}SingleStateImplProvider";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/state/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.single_state_impl.dart",
    );
  }

  String get myPartPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/state/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.single_state_impl.custom.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.extend = refer("AsyncNotifier<${_aggregateRootName.myClassName}?>");

      p0.fields.add(Field((f) {
        f.name = "_${_aggregateRootName.keyInstanceName}";
        f.type = refer("${_aggregateRootName.keyClassName}?");
        f.docs.add("// ignore: unused_field");
      }));

      final build = Method((m) {
        m.annotations.add(
          CodeExpression(Code('override')),
        );
        m.returns = refer("Future<${_aggregateRootName.myClassName}?>");
        m.name = "build";
        m.modifier = MethodModifier.async;
        m.body = Code('''
return null;
''');
      });

      final setMethod = Method((m) {
        m.returns = refer("Future<${_aggregateRootName.myClassName}?>");
        m.name = "set";
        m.modifier = MethodModifier.async;
        m.optionalParameters.add(Parameter((p0) {
          p0.name = _aggregateRootName.keyInstanceName;
          p0.type = refer(
              "${_aggregateRootName.keyArgumentElement.type.getDisplayString(withNullability: false)}");
          p0.required = true;
          p0.named = true;
        }));
        m.body = Code('''
state = const AsyncValue.loading();
final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (target, err) = await service.find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return null;
}
if (target == null) {
  _${_aggregateRootName.keyInstanceName} = null;
  state = const AsyncValue.data(null);
  return null;
}
_${_aggregateRootName.keyInstanceName} = ${_aggregateRootName.keyInstanceName};
state = AsyncValue.data(target);
return target;
''');
      });

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
          final methodName = method.displayName;
          m.name = methodName;
          m.returns = refer("Future<void>");
          m.modifier = MethodModifier.async;
          for (final param in method.parameters) {
            if (param.isNamed) {
              m.optionalParameters.add(Parameter((p0) {
                p0.name = param.name;
                p0.type =
                    refer(param.type.getDisplayString(withNullability: true));
                p0.required = param.isRequired;
                p0.named = param.isNamed;
              }));
            } else {
              m.requiredParameters.add(Parameter((p0) {
                p0.name = param.name;
                p0.type =
                    refer(param.type.getDisplayString(withNullability: true));
                p0.required = false;
                p0.named = false;
              }));
            }
          }
          final doc = method.documentationComment;
          if (doc != null) {
            m.docs.add(doc);
          }
          m.body = Code('''
state = const AsyncValue.loading();
final ${_aggregateRootName.keyInstanceName} = _${_aggregateRootName.keyInstanceName};
if (${_aggregateRootName.keyInstanceName} == null) {
  state = AsyncValue.error(
      "[${myClassName}Error] ${_aggregateRootName.keyInstanceName} is null.",
      StackTrace.current);
  return;
}
final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (changed, err) = await service.${methodName}(${_aggregateRootName.methodArguments(methodName, withKey: true)});
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return;
}
if (changed == null) {
  state = AsyncValue.error(
      "[${myClassName}Error] Failed to execute [${methodName}]. ${_aggregateRootName.keyInstanceName}[\$${_aggregateRootName.keyInstanceName}]",
      StackTrace.current);
  return;
}
state = AsyncValue.data(changed);
''');
        }));
      }

      p0.methods.addAll([
        build,
        setMethod,
      ]);
      p0.methods.addAll(methodList);
    });
  }
}
