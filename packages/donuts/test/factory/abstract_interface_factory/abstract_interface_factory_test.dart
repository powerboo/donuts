import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:test/scaffolding.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

void main() async {
  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'factory', 'test_data');

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

  // common class
  final annotatedVariable = await initializeLibraryReaderForDirectory(
    path,
    'common_class.dart',
  );

  testAnnotatedElements(
    annotatedVariable,
    AbstractInterfaceFactoryGenerator(),
  );

  /*
  // */
}
