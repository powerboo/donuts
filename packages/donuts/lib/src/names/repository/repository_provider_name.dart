import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/repository/in_memory_repository_impl_name.dart';
import 'package:donuts/src/names/repository/repository_impl_name.dart';
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

  String get myPartPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/repository/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.repository_provider.custom.dart",
    );
  }

  Field toFieldElement() {
    return Field((p0) {
      p0.name = myFieldName;
      p0.modifier = FieldModifier.final$;
      if (_aggregateRootName.customRepository) {
        p0.docs.addAll([
          "",
          "/// [${_aggregateRootName.myClassName}] is interface or abstract",
          "/// must be implement custom factory.",
          "/// Please check Section XXX in https://pub.dev/packages/donuts",
          "/// create file : ${_aggregateRootName.myClassName.toSnakeCase()}.repository_provider.custom.dart",
          "/// Please copy and paste the following text into the file",
          "/*",
          "part of '${_aggregateRootName.myClassName.toSnakeCase()}.repository_provider.dart';",
          "class ${_repositoryImplName.myClassName}Custom",
          "    implements ${_repositoryName.myClassName} {",
          "}",
          "*/",
        ]);
        p0.assignment = Code('''
Provider<${_repositoryName.myClassName}>((ref) {
  return ${_repositoryImplName.myClassName}Custom();
})
''');

        return;
      } else {
        p0.assignment = Code('''
Provider<${_repositoryName.myClassName}>((ref) {
  const bool inMemory = ${_inMemory.toString()};
  if(inMemory){
    return ${_inMemoryRepositoryImpl.myClassName}();
  }
  // ignore: dead_code
  return ${_repositoryImplName.myClassName}();
})
''');
      }
    });
  }
}
