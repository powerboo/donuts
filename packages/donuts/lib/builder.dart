import 'package:build/build.dart';
import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:source_gen/source_gen.dart';

// -------------- factory ----------------
/// abstract interface factory
Builder abstractInterfaceFactoryBuilder(BuilderOptions options) {
  return LibraryBuilder(
    AbstractInterfaceFactoryGenerator(),
    generatedExtension: ".abstract_interface_factory.dart",
    options: options,
  );
}
