import 'package:donuts/src/generator/common/element_checker.dart';
import 'package:donuts/src/names/application_service/abstract_interface_application_service_name.dart';
import 'package:donuts/src/names/application_service/application_service_impl_name.dart';
import 'package:donuts/src/names/common/aggregate_root_name.dart';
import 'package:code_builder/code_builder.dart';
import 'package:donuts/src/names/factory/abstract_interface_factory_name.dart';
import 'package:donuts/src/names/factory/factory_provider_name.dart';
import 'package:donuts/src/names/repository/abstract_interface_repository_name.dart';
import 'package:donuts/src/names/repository/repository_provider_name.dart';
import 'package:path/path.dart' as p;

class ApplicationServiceProviderName {
  final AggregateRootName _aggregateRootName;
  final ApplicationServiceImplName _applicationServiceImplName;
  final AbstractInterfaceRepositoryName _abstractInterfaceRepositoryName;
  final AbstractInterfaceFactoryName _abstractInterfaceFactoryName;
  final FactoryProviderName _factoryProvider;
  final RepositoryProviderName _repositoryProvider;
  final AbstractInterfaceApplicationServiceName
      _abstractInterfaceApplicationServiceName;

  ApplicationServiceProviderName({
    required AggregateRootName aggregateRootName,
    required ApplicationServiceImplName applicationServiceImplName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
    required AbstractInterfaceFactoryName abstractInterfaceFactoryName,
    required FactoryProviderName factoryProvider,
    required RepositoryProviderName repositoryProvider,
    required AbstractInterfaceApplicationServiceName
        abstractInterfaceApplicationServiceName,
  })  : _aggregateRootName = aggregateRootName,
        _applicationServiceImplName = applicationServiceImplName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName,
        _abstractInterfaceFactoryName = abstractInterfaceFactoryName,
        _factoryProvider = factoryProvider,
        _repositoryProvider = repositoryProvider,
        _abstractInterfaceApplicationServiceName =
            abstractInterfaceApplicationServiceName;

  String get myFieldName {
    return "${_aggregateRootName.myInstanceName}ApplicationServiceProvider";
  }

  String get myPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/application_service/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.application_service_provider.dart",
    );
  }

  String get myPartPath {
    return p.join(
      "package:${_aggregateRootName.packageName}/donuts/application_service/",
      _aggregateRootName.baseDirectory,
      "${_aggregateRootName.fileName}.application_service_provider.custom.dart",
    );
  }

  Field toFieldElement() {
    return Field((p0) {
      p0.name = myFieldName;
      p0.modifier = FieldModifier.final$;
      if (_aggregateRootName.customApplicationService) {
        p0.docs.addAll([
          "",
          "/// [${_aggregateRootName.myClassName}] is interface or abstract",
          "/// must be implement custom factory.",
          "/// Please check Section XXX in https://pub.dev/packages/donuts",
          "/// create file : ${_aggregateRootName.myClassName.toSnakeCase()}.application_service_provider.custom.dart",
          "/// Please copy and paste the following text into the file",
          "/*",
          "part of '${_aggregateRootName.myClassName.toSnakeCase()}.application_service_provider.dart';",
          "class ${_applicationServiceImplName.myClassName}Custom ",
          "   extends ${_applicationServiceImplName.myClassName}{",
          "    ${_applicationServiceImplName.myClassName}Custom({",
          "  required this.ref,",
          "  required this.${_abstractInterfaceFactoryName.myInstanceName},",
          "  required this.${_abstractInterfaceRepositoryName.myInstanceName},",
          "  }): super (",
          "${_abstractInterfaceFactoryName.myInstanceName} : ${_abstractInterfaceFactoryName.myInstanceName},",
          "${_abstractInterfaceRepositoryName.myInstanceName} : ${_abstractInterfaceRepositoryName.myInstanceName},",
          ");",
          "  final ProviderRef<${_abstractInterfaceApplicationServiceName.myClassName}> ref;",
          "  final ${_abstractInterfaceFactoryName.myClassName} ${_abstractInterfaceFactoryName.myInstanceName};",
          "  final ${_abstractInterfaceRepositoryName.myClassName} ${_abstractInterfaceRepositoryName.myInstanceName};",
          "}",
          "*/",
        ]);
        p0.assignment = Code('''
Provider<${_abstractInterfaceApplicationServiceName.myClassName}>((ref) {
  return ${_applicationServiceImplName.myClassName}Custom(
    ref: ref,
    ${_abstractInterfaceFactoryName.myInstanceName} : ref.watch(${_factoryProvider.myFieldName}),
    ${_abstractInterfaceRepositoryName.myInstanceName} : ref.watch(${_repositoryProvider.myFieldName}),
  );
})
''');
      } else {
        p0.assignment = Code('''
Provider<${_applicationServiceImplName.myClassName}>((ref) {
  return ${_applicationServiceImplName.myClassName}(
    ${_abstractInterfaceFactoryName.myInstanceName} : ref.watch(${_factoryProvider.myFieldName}),
    ${_abstractInterfaceRepositoryName.myInstanceName} : ref.watch(${_repositoryProvider.myFieldName}),
  );
})
''');
      }
    });
  }
}
