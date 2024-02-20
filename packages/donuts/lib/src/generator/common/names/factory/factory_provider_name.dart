import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/generator/common/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/generator/common/names/factory/factory_impl_name.dart';
import 'package:donuts/src/generator/common/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/generator/common/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/generator/common/names/repository/repository_impl_name.dart';
import 'package:path/path.dart' as p;
import 'package:donuts/src/generator/common/element_checker.dart';

class FactoryProviderName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceFactoryName _factoryName;
  final FactoryImplName _factoryNameImpl;

  FactoryProviderName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceFactoryName factoryName,
    required FactoryImplName factoryNameImpl,
  })  : _aggregateRootName = aggregateRootName,
        _factoryName = factoryName,
        _factoryNameImpl = factoryNameImpl;

  String get myFieldName {
    return "${_factoryName.myInstanceName}Provider";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/factory/",
      _aggregateRootName.baseDirectory,
      "${myFieldName.toSnakeCase()}.dart",
    );
  }

  Field toFieldElement() {
    return Field((p0) {
      p0.name = "${_factoryName.myInstanceName}Provider";
      p0.modifier = FieldModifier.final$;
      p0.assignment = Code('''
Provider<${_factoryName.myClassName}>((ref) {
  return ${_factoryNameImpl.myClassName}();
})
''');
    });
  }
}
