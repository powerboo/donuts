import 'package:donuts/src/generator/common/names/application_service/application_service_provider_name.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

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
      "${myClassName.toSnakeCase()}.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.extend = refer("AsyncNotifier<${_aggregateRootName.myClassName}?>");

      p0.fields.add(Field((f) {
        f.name = '_service';
        f.modifier = FieldModifier.final$;
        f.assignment = Code("ref.watch(${_applicationServiceProviderName.myFieldName})");
      }));

      p0.fields.add(Field((f) {
        f.name = "_${_aggregateRootName.keyInstanceName}";
        f.type = refer("${_aggregateRootName.keyClassName}?");
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
        m.body = Code('''
state = AsyncValue.load();
final (target, err) = await _service.find(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return null;
}
if (target == null) {
  _${_aggregateRootName.keyInstanceName} = null;
  state = null;
  return null;
}
_${_aggregateRootName.keyInstanceName} = ${_aggregateRootName.keyInstanceName};
state = AsyncValue.data(target);
return target;
''');
      });

      final List<Method> methodList = [];
      for (final method in _aggregateRootName.element.methods) {
        methodList.add(Method((m) {
          final methodName = method.displayName;
          m.name = methodName;
          m.returns = refer("Future<void>");
          m.modifier = MethodModifier.async;
          final doc = method.documentationComment;
          if (doc != null) {
            m.docs.add(doc);
          }
          m.body = Code('''
state = AsyncValue.load();
final ${_aggregateRootName.keyInstanceName} = _${_aggregateRootName.keyInstanceName};
if (${_aggregateRootName.keyInstanceName} == null) {
  state = AsyncValue.error(
      "[${myClassName}Error] ${_aggregateRootName.keyInstanceName} is null.",
      StackTrace.current);
  return;
}
final (changed, err) = await _service.${methodName}(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return;
}
if (changed == null) {
  state = AsyncValue.error(
      "[${myClassName}Error] Failed to execute [${methodName}]. ${_aggregateRootName.keyInstanceName}[\${${_aggregateRootName.keyInstanceName}}]",
      StackTrace.current);
  return;
}
state = changed;
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
