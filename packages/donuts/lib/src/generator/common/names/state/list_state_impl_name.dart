import 'package:analyzer/dart/element/element.dart';
import 'package:donuts/src/generator/common/names/application_service/application_service_provider_name.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

class ListStateImplName {
  final AggregateRootName _aggregateRootName;
  final ApplicationServiceProviderName _applicationServiceProviderName;

  ListStateImplName({
    required AggregateRootName aggregateRootName,
    required ApplicationServiceProviderName applicationServiceProviderName,
  })  : _aggregateRootName = aggregateRootName,
        _applicationServiceProviderName = applicationServiceProviderName;

  String get myClassName {
    return "${_aggregateRootName.element.displayName}ListStateImpl";
  }

  String get myInstanceName {
    return "${_aggregateRootName.myInstanceName}ListStateImplProvider";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/state/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.list_state_impl.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.extend =
          refer("AsyncNotifier<List<${_aggregateRootName.myClassName}>>");

      final fetchAll = Method((m) {
        m.name = '_fetchAll';
        m.modifier = MethodModifier.async;
        m.returns = refer("Future<void>");
        m.body = Code('''
final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (list, err) = await service.all();
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return;
}
if (list == null) {
  state = AsyncValue.error(
      "[${myClassName}Error] ${_aggregateRootName.myInstanceName} is null.",
      StackTrace.current);
  return;
}
state = AsyncValue.data(list);
''');
      });

      final build = Method((m) {
        m.annotations.add(
          CodeExpression(Code('override')),
        );
        m.returns = refer("Future<List<${_aggregateRootName.myClassName}>>");
        m.name = "build";
        m.modifier = MethodModifier.async;
        m.body = Code('''
state = const AsyncValue.loading();

final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (list, err) = await service.all();
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return [];
}
if(list == null){
  state = AsyncValue.error(
      "[${myClassName}Error] ${_aggregateRootName.myInstanceName} is null.",
      StackTrace.current);
  return [];
}
return list;
''');
      });

      final create = Method((m) {
        m.returns = refer("Future<void>");
        m.name = "create";
        m.modifier = MethodModifier.async;
        // Distribute arguments to the appropriate lists
        for (final param in _aggregateRootName.constructorElement.children) {
          if (param is! ParameterElement) {
            continue;
          }
          if (param.metadata.any((annotation) =>
              annotation.element?.displayName == 'KeyArgument')) {
            continue;
          }
          if (param.isNamed) {
            m.requiredParameters.add(Parameter((p0) {
              p0.name = param.name;
              p0.type =
                  refer(param.type.getDisplayString(withNullability: true));
              p0.required = false;
              p0.named = false;
            }));
          } else {
            m.optionalParameters.add(Parameter((p0) {
              p0.name = param.name;
              p0.type =
                  refer(param.type.getDisplayString(withNullability: true));
              p0.required = param.isRequiredNamed;
              p0.named = param.isNamed;
            }));
          }
        }

        m.body = Code('''
state = const AsyncValue.loading();

final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (${_aggregateRootName.myInstanceName}, err) = await service.create(${_aggregateRootName.initArgumentString(ignoreKey: true)});
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return;
}
if(${_aggregateRootName.myInstanceName} == null){
  state = AsyncValue.error("[${myClassName}Error] ${_aggregateRootName.myInstanceName} is null.", StackTrace.current);
  return;
}
await _fetchAll();
''');
      });
      final delete = Method((m) {
        m.returns = refer("Future<void>");
        m.name = "delete";
        m.modifier = MethodModifier.async;
        m.optionalParameters.add(Parameter((p) {
          p.name = _aggregateRootName.keyInstanceName;
          p.type = refer(_aggregateRootName.keyClassName);
          p.required = true;
          p.named = true;
        }));

        m.body = Code('''
final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (_, err) = await service.delete(${_aggregateRootName.keyInstanceName}: ${_aggregateRootName.keyInstanceName});
if (err != null) {
  return;
}
await _fetchAll();
''');
      });

      final find = Method((m) {
        m.returns = refer("Future<${_aggregateRootName.myClassName}?>");
        m.name = "find";
        m.optionalParameters.add(Parameter((p) {
          p.name = _aggregateRootName.keyInstanceName;
          p.type = refer(_aggregateRootName.keyClassName);
          p.required = true;
          p.named = true;
        }));
        m.modifier = MethodModifier.async;
        m.body = Code('''
final service = ref.watch(${_applicationServiceProviderName.myFieldName});
final (${_aggregateRootName.myInstanceName}, err) = await service.find(key: key);
if (err != null) {
  return null;
}
return ${_aggregateRootName.myInstanceName};
''');
      });
      final refresh = Method((m) {
        m.returns = refer("Future<void>");
        m.name = "refresh";
        m.modifier = MethodModifier.async;
        m.body = Code('''
state = const AsyncValue.loading();
await _fetchAll();
''');
      });

      p0.methods.addAll([
        fetchAll,
        build,
        create,
        find,
        delete,
        refresh,
      ]);
    });
  }
}

class ListStateNameException implements Exception {
  late final String message;
  ListStateNameException(final String message) {
    this.message = "[ListStateNameException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
