import 'package:donuts/src/generator/factory/factory_impl_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

import '../../common/test_function.dart';

void main() async {
  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'factory', 'factory_impl', 'test_data');

  // parent dir is aggregate root
  final parentDirIsAggregateRoot = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/parent_dir_is_aggregate_root_class.dart',
  );

  testAnnotatedElements(
    parentDirIsAggregateRoot,
    FactoryImplGenerator(),
  );
}
