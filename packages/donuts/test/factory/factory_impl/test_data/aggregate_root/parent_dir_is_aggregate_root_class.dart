import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/aggregate_root/parent_dir_is_aggregate_root_class.dart';

abstract interface class ParentDirIsAggregateRootClassFactory {
  ParentDirIsAggregateRootClass create(
    String value,
    String? nullableValue, {
    required String name,
  });
  ParentDirIsAggregateRootClass restore(
    String value,
    String? nullableValue, {
    required String key,
    required String name,
  });
}
''')
@AggregateRoot()
class ParentDirIsAggregateRootClass {
  final String name;
  const ParentDirIsAggregateRootClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
}
