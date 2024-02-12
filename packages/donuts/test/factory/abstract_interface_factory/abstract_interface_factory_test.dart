import 'package:donuts/src/generator/factory/abstract_interface_factory_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

import '../../common/test_function.dart';

void main() async {
  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'factory', 'abstract_interface_factory', 'test_data');

  // /*
  // parent dir is aggregate root
  final parentDirIsAggregateRoot = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/parent_dir_is_aggregate_root_class.dart',
  );

  testAnnotatedElements(
    parentDirIsAggregateRoot,
    AbstractInterfaceFactoryGenerator(),
  );

  // parent dir is aggregate root
  final parentDirIsOtherDir = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'other_dir/parent_dir_is_other_dir_class.dart',
  );

  testAnnotatedElements(
    parentDirIsOtherDir,
    AbstractInterfaceFactoryGenerator(),
  );

  // does not have default constructor
  final doesNotHaveDefaultConstructor = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/does_not_have_default_constructor.dart',
  );

  testAnnotatedElements(
    doesNotHaveDefaultConstructor,
    AbstractInterfaceFactoryGenerator(),
  );

  // annotated field does not exists
  final annotatedFieldDoesNotExists = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/annotated_argument_does_not_exists.dart',
  );

  testAnnotatedElements(
    annotatedFieldDoesNotExists,
    AbstractInterfaceFactoryGenerator(),
  );

  // duplicate key argument
  final duplicateKeyArgument = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/duplicate_key_argument.dart',
  );

  testAnnotatedElements(
    duplicateKeyArgument,
    AbstractInterfaceFactoryGenerator(),
  );

  // common class
  final commonClass = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/common_class.dart',
  );

  testAnnotatedElements(
    commonClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // freezed class
  final freezedClass = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/freezed_class.dart',
  );

  testAnnotatedElements(
    freezedClass,
    AbstractInterfaceFactoryGenerator(),
  );

  // */
  // json serializable class
  final jsonSerializableClass = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/json_serializable_class.dart',
  );

  testAnnotatedElements(
    jsonSerializableClass,
    AbstractInterfaceFactoryGenerator(),
  );
}
