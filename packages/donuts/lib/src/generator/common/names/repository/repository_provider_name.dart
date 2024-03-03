import 'package:donuts/src/generator/common/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/generator/common/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/generator/common/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/generator/common/names/repository/repository_impl_name.dart';
import 'package:path/path.dart' as p;

class RepositoryProviderName {
  final AggregateRootName _aggregateRootName;
  final AbstractInterfaceRepositoryName _repositoryName;
  final RepositoryImplName _repositoryImplName;
  final InMemoryRepositoryImplName _inMemoryRepositoryImpl;
  final bool _inMemory;

  RepositoryProviderName({
    required AggregateRootName aggregateRootName,
    required AbstractInterfaceRepositoryName repositoryName,
    required RepositoryImplName repositoryImplName,
    required InMemoryRepositoryImplName inMemoryRepositoryImpl,
    required bool inMemory,
  })  : _aggregateRootName = aggregateRootName,
        _repositoryName = repositoryName,
        _repositoryImplName = repositoryImplName,
        _inMemoryRepositoryImpl = inMemoryRepositoryImpl,
        _inMemory = inMemory;

  String get myFieldName {
    return "${_repositoryName.myInstanceName}Provider";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/repository/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.repository_provider.dart",
    );
  }

  Field toFieldElement() {
    return Field((p0) {
      p0.name = myFieldName;
      p0.modifier = FieldModifier.final$;
      p0.assignment = Code('''
Provider<${_repositoryName.myClassName}>((ref) {
  const bool inMemory = ${_inMemory.toString()};
  if(inMemory){
    // ignore: dead_code
    return ${_inMemoryRepositoryImpl.myClassName}();
  }
  // ignore: dead_code
  return ${_repositoryImplName.myClassName}();
})
''');
    });
  }
}
