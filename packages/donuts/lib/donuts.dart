import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:donuts/src/generator/application_service/abstract_interface_application_service_generator.dart';
import 'package:donuts/src/generator/application_service/application_service_impl_generator.dart';
import 'package:donuts/src/generator/application_service/application_service_provider_generator.dart';
import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:donuts/src/generator/factory/factory_impl_generator.dart';
import 'package:donuts/src/generator/factory/factory_provider_generator.dart';
import 'package:donuts/src/generator/repository/abstract_interface_repository_generator.dart';
import 'package:donuts/src/generator/repository/in_memory_repository_impl_generator.dart';
import 'package:donuts/src/generator/repository/repository_impl_generator.dart';
import 'package:donuts/src/generator/repository/repository_provider_generator.dart';
import 'package:donuts/src/generator/state/list_state_generator.dart';
import 'package:donuts/src/generator/state/single_state_generator.dart';
import 'package:donuts/src/generator/view/create_modal_generator.dart';
import 'package:donuts/src/generator/view/detail_view_generator.dart';
import 'package:donuts/src/generator/view/list_view_generator.dart';

/*

// -------------- input ----------------
package:{dir}/aggregate_root/sample.dart

// -------------- output ----------------
package:donuts/factory/{dir}/sample.abstract_interface_factory.dart
package:donuts/factory/{dir}/sample.factory_impl.dart
package:donuts/factory/{dir}/sample.factory_provider.dart
package:donuts/repository/{dir}/sample.abstract_interface_repository.dart
package:donuts/repository/{dir}/sample.repository_impl.dart
package:donuts/repository/{dir}/sample.in_memory_repository_impl.dart
package:donuts/repository/{dir}/sample.repository_provider.dart
package:donuts/application_service/{dir}/sample.application_service.dart
package:donuts/application_service/{dir}/sample.application_service_provider.dart
package:donuts/state/{dir}/sample.list_state.dart
package:donuts/state/{dir}/sample.single_state.dart
package:donuts/view/{dir}/sample.list_view.dart
package:donuts/view/{dir}/sample.detail_view.dart
package:donuts/view/{dir}/sample.create_dialog.dart
// */

// -------------- factory ----------------
/// abstract interface factory
Builder abstractInterfaceFactoryBuilder(BuilderOptions options) {
  return LibraryBuilder(
    AbstractInterfaceFactoryGenerator(),
    generatedExtension: ".abstract_interface_factory.dart",
    options: options,
  );
}

/// factory impl
Builder factoryImplBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FactoryImplGenerator(),
    generatedExtension: ".factory_impl.dart",
    options: options,
  );
}

/// factory provider
Builder factoryProviderBuilder(BuilderOptions options) {
  return LibraryBuilder(
    FactoryProviderGenerator(),
    generatedExtension: ".factory_provider.dart",
    options: options,
  );
}

// -------------- repository ----------------
/// abstract interface repository
Builder abstractInterfaceRepositoryBuilder(BuilderOptions options) {
  return LibraryBuilder(
    AbstractInterfaceRepositoryGenerator(),
    generatedExtension: ".abstract_interface_repository.dart",
    options: options,
  );
}

/// repository impl
Builder repositoryImplBuilder(BuilderOptions options) {
  return LibraryBuilder(
    RepositoryImplGenerator(),
    generatedExtension: ".repository_impl.dart",
    options: options,
  );
}

/// in memory repository impl
Builder inMemoryRepositoryImplBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InMemoryRepositoryImplGenerator(),
    generatedExtension: ".in_memory_repository_impl.dart",
    options: options,
  );
}

/// repository provider
Builder repositoryProviderBuilder(BuilderOptions options) {
  return LibraryBuilder(
    RepositoryProviderGenerator({'in_memory': true}),
    generatedExtension: ".repository_provider.dart",
    options: options,
  );
}

// -------------- application service ----------------
/// abstract interface application service
Builder abstractInterfaceApplicationServiceBuilder(BuilderOptions options) {
  return LibraryBuilder(
    AbstractInterfaceApplicationServiceGenerator(),
    generatedExtension: ".abstract_interface_application_service.dart",
    options: options,
  );
}

/// application service impl
Builder applicationServiceImplBuilder(BuilderOptions options) {
  return LibraryBuilder(
    ApplicationServiceImplGenerator(),
    generatedExtension: ".application_service.dart",
    options: options,
  );
}

/// application service provider
Builder applicationServiceProviderBuilder(BuilderOptions options) {
  return LibraryBuilder(
    ApplicationServiceProviderGenerator({'in_memory': true}),
    generatedExtension: ".application_service_provider.dart",
    options: options,
  );
}

// -------------- state ----------------
/// list state
Builder listStateBuilder(BuilderOptions options) {
  return LibraryBuilder(
    ListStateGenerator({'in_memory': false}),
    generatedExtension: ".list_state_impl.dart",
    options: options,
  );
}

/// single state
Builder singleStateBuilder(BuilderOptions options) {
  return LibraryBuilder(
    SingleStateGenerator({'in_memory': false}),
    generatedExtension: ".single_state_impl.dart",
    options: options,
  );
}

// -------------- view ----------------
/// list view
Builder listViewBuilder(BuilderOptions options) {
  return LibraryBuilder(
    ListViewGenerator({'in_memory': false}),
    generatedExtension: ".list_view.dart",
    options: options,
  );
}

/// detail view
Builder detailViewBuilder(BuilderOptions options) {
  return LibraryBuilder(
    DetailViewGenerator({'in_memory': false}),
    generatedExtension: ".detail_view.dart",
    options: options,
  );
}

/// create view
Builder createModalBuilder(BuilderOptions options) {
  return LibraryBuilder(
    CreateModalGenerator({'in_memory': false}),
    generatedExtension: ".create_modal.dart",
    options: options,
  );
}
