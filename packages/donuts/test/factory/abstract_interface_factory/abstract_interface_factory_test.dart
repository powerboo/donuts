import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

void main() async {
  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'factory', 'abstract_interface_factory', 'test_data');

  // abstract_interface_class
  final abstractInterfaceClass = await initializeLibraryReaderForDirectory(
    path,
    'abstract_interface_class.dart',
  );

  testAnnotatedElements(
    abstractInterfaceClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // abstract_class
  final abstractClass = await initializeLibraryReaderForDirectory(
    path,
    'abstract_class.dart',
  );

  testAnnotatedElements(
    abstractClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // interface_class
  final interfaceClass = await initializeLibraryReaderForDirectory(
    path,
    'interface_class.dart',
  );

  testAnnotatedElements(
    interfaceClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // common class
  final commonClass = await initializeLibraryReaderForDirectory(
    path,
    'common_class.dart',
  );

  testAnnotatedElements(
    commonClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // does not have default constructor
  final doesNotHaveDefaultConstructor = await initializeLibraryReaderForDirectory(
    path,
    'does_not_have_default_constructor.dart',
  );

  testAnnotatedElements(
    doesNotHaveDefaultConstructor,
    AbstractInterfaceFactoryGenerator(),
  );

  // annotated field does not exists
  final annotatedFieldDoesNotExists = await initializeLibraryReaderForDirectory(
    path,
    'annotated_argument_does_not_exists.dart',
  );

  testAnnotatedElements(
    annotatedFieldDoesNotExists,
    AbstractInterfaceFactoryGenerator(),
  );

  // duplicate key argument
  final duplicateKeyArgument = await initializeLibraryReaderForDirectory(
    path,
    'duplicate_key_argument.dart',
  );

  testAnnotatedElements(
    duplicateKeyArgument,
    AbstractInterfaceFactoryGenerator(),
  );

  // freezed class
  final freezedClass = await initializeLibraryReaderForDirectory(
    path,
    'freezed_class.dart',
  );

  testAnnotatedElements(
    freezedClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // json serializable class
  final jsonSerializableClass = await initializeLibraryReaderForDirectory(
    path,
    'json_serializable_class.dart',
  );

  testAnnotatedElements(
    jsonSerializableClass,
    AbstractInterfaceFactoryGenerator(),
  );
}
