import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/factory/factory_impl_name.dart';
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
      "${_aggregateRootName.fileName}.factory_provider.dart",
    );
  }

  String get myPartPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/factory/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.factory_provider.custom.dart",
    );
  }

  Field toFieldElement() {
    return Field((p0) {
      p0.name = "${_factoryName.myInstanceName}Provider";
      p0.modifier = FieldModifier.final$;

      if (_aggregateRootName.isInterface || _aggregateRootName.customFactory) {
        p0.assignment = Code('''
Provider<${_factoryName.myClassName}>((ref) {
  return ${_factoryNameImpl.myClassName}Custom();
})
''');
        p0.docs.addAll([
          "",
          "/// [${_aggregateRootName.myClassName}] is interface or abstract",
          "/// must be implement custom factory.",
          "/// Please check Section XXX in https://pub.dev/packages/donuts",
          "/// create file : ${_aggregateRootName.myClassName.toSnakeCase()}.factory_provider.custom.dart",
          "/// Please copy and paste the following text into the file",
          "/*",
          "part of '${_aggregateRootName.myClassName.toSnakeCase()}.factory_provider.dart';",
          "class ${_factoryNameImpl.myClassName}Custom",
          "    implements ${_factoryName.myClassName} {",
          "  @override",
          "  ${_aggregateRootName.myClassName} create() {",
          "    throw UnimplementedError();",
          "  }",
          "",
          "  @override",
          "  ${_aggregateRootName.myClassName} restore(String key) {",
          "    throw UnimplementedError();",
          "  }",
          "}",
          "*/",
        ]);
      } else {
        late final String keyFactoryString;
        if (!(_aggregateRootName.keyFactoryName == null ||
            _aggregateRootName.keyType == "String")) {
          keyFactoryString =
              "const KeyFactory? keyFactory = ${_aggregateRootName.keyFactoryName!.initializer()};";
          p0.assignment = Code('''
Provider<${_factoryName.myClassName}>((ref) {
  ${keyFactoryString}
  return ${_factoryNameImpl.myClassName}(keyFactory: keyFactory);
})
''');
        } else {
          p0.assignment = Code('''
Provider<${_factoryName.myClassName}>((ref) {
  return ${_factoryNameImpl.myClassName}();
})
''');
        }
      }
    });
  }
}
