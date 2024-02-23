import 'package:donuts/src/generator/state/list_state_generator.dart';
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

  final path = p.join('test', 'state', 'list_state', 'test_data');

  // common class
  final commonClass = await initializeLibraryReaderForDirectoryWithDirectory(
    path,
    'aggregate_root/common_class.dart',
  );

  testAnnotatedElements(
    commonClass,
    ListStateGenerator({'in_memory': false}),
  );
}
