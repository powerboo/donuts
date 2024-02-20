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
      "${myClassName.toSnakeCase()}.dart",
    );
  }

  Class toClassElement() {
    return Class((p0) {
      p0.name = myClassName;
      p0.extend = refer("AsyncNotifier<List<${_aggregateRootName.myClassName}>>");

      p0.fields.add(Field((f) {
        f.name = 'service';
        f.modifier = FieldModifier.final$;
        f.assignment = Code("ref.watch(${_applicationServiceProviderName.myFieldName})");
      }));

      final build = Method((m) {
        m.annotations.add(
          CodeExpression(Code('override')),
        );
        m.returns = refer("Future<List<${_aggregateRootName.myClassName}>>");
        m.name = "build";
        m.modifier = MethodModifier.async;
        m.body = Code("return [];");
      });

      final create = Method((m) {
        m.returns = refer("Future<void>");
        m.name = "create";
        m.modifier = MethodModifier.async;
        m.body = Code('''
state = AsyncValue.load();
final (${_aggregateRootName.myInstanceName}, err) = await service.create();
if (err != null) {
  state = AsyncValue.error(err.error, err.stackTrace);
  return;
}
if(${_aggregateRootName.myInstanceName} == null){
  state = AsyncValue.error("[${myClassName}Error] ${_aggregateRootName.myInstanceName} is null.", StackTrace.current);
  return;
}
state = ${_aggregateRootName.myInstanceName};
''');
      });

      /*
      final find = Method((m) {});
      final save = Method((m) {});
      final delete = Method((m) {});
      final all = Method((m) {});
      // */

      p0.methods.addAll([
        build,
        create,
        /*
        find,
        save,
        delete,
        all,
        // */
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
