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

  ApplicationServiceProviderName({
    required AggregateRootName aggregateRootName,
    required ApplicationServiceImplName applicationServiceImplName,
    required AbstractInterfaceRepositoryName abstractInterfaceRepositoryName,
    required AbstractInterfaceFactoryName abstractInterfaceFactoryName,
    required FactoryProviderName factoryProvider,
    required RepositoryProviderName repositoryProvider,
  })  : _aggregateRootName = aggregateRootName,
        _applicationServiceImplName = applicationServiceImplName,
        _abstractInterfaceRepositoryName = abstractInterfaceRepositoryName,
        _abstractInterfaceFactoryName = abstractInterfaceFactoryName,
        _factoryProvider = factoryProvider,
        _repositoryProvider = repositoryProvider;

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

  Field toFieldElement() {
    return Field((p0) {
      p0.name = myFieldName;
      p0.modifier = FieldModifier.final$;
      p0.assignment = Code('''
Provider<${_applicationServiceImplName.myClassName}>((ref) {
  return ${_applicationServiceImplName.myClassName}(
    ${_abstractInterfaceFactoryName.myInstanceName} : ref.watch(${_factoryProvider.myFieldName}),
    ${_abstractInterfaceRepositoryName.myInstanceName} : ref.watch(${_repositoryProvider.myFieldName}),
    ref : ref,
  );
})
''');
    });
  }
}
