import 'package:donuts/src/generator/repository/abstract_interface_repository_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

import '../../common/test_function.dart';

void main() async {
  initializeBuildLogTracking();

  tearDown(() {
    clearBuildLog();
  });

  final path = p.join('test', 'repository', 'abstract_interface_api', 'test_data');

  // parent dir is aggregate root
  final parentDirIsAggregateRoot = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/common_class.dart',
  );

  testAnnotatedElements(
    parentDirIsAggregateRoot,
    AbstractInterfaceRepositoryGenerator(),
  );
}