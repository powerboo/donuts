import 'package:donuts/src/generator/factory/factory_provider_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

import '../../common/test_function.dart';

void main() async {
  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'factory', 'factory_provider', 'test_data');

  // common class
  final parentDirIsAggregateRoot = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/common_class.dart',
  );

  testAnnotatedElements(
    parentDirIsAggregateRoot,
    FactoryProviderGenerator(),
  );
}