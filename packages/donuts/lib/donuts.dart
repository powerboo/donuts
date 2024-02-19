import 'package:build/build.dart';
import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:source_gen/source_gen.dart';

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
