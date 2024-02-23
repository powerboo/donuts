import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

class AbstractInterfaceApiName {
  final AggregateRootName _aggregateRootName;
  AbstractInterfaceApiName({
    required AggregateRootName aggregateRootName,
  }) : _aggregateRootName = aggregateRootName;
  String get myClassName {
    return "${_aggregateRootName.element.displayName}RepositoryApi";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/repository/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.myClassName.toSnakeCase()}.dart",
    );
  }

  Class toClassElement() {
    return Class(
      (p0) {},
    );
  }
}
