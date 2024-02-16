import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/aggregate_root/parent_dir_is_aggregate_root_class.dart';
import 'package:__test__/donuts/factory/abstract_interface_parent_dir_is_aggregate_root_class.dart';
import 'package:uuid/uuid.dart';

class ParentDirIsAggregateRootClassFactoryImpl
    implements ParentDirIsAggregateRootClassFactory {
  final Uuid uuid = Uuid();

  ParentDirIsAggregateRootClass create(
    String value,
    String? nullableValue, {
    required String name,
  }) {
    final key = uuid.v7();

    return ParentDirIsAggregateRootClass(value, nullableValue, {
      key: key,
      name: name,
    });
  }

  ParentDirIsAggregateRootClass restore(
    String value,
    String? nullableValue, {
    required String key,
    required String name,
  }) {
    return ParentDirIsAggregateRootClass(value, nullableValue, {
      key: key,
      name: name,
    });
  }
}''')
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
