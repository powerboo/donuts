import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

class ListStateImplName {
  final AggregateRootName _aggregateRootName;
  // final ApplicationServiceImplName _applicationServiceImplName;

  ListStateImplName({
    required AggregateRootName aggregateRootName,
  }) : _aggregateRootName = aggregateRootName;

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
        m.returns = refer("Future<${_aggregateRootName.myClassName}>");
        m.modifier = MethodModifier.async;
        m.body = null;
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
