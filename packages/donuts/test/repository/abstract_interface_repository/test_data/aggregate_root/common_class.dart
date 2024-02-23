import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/aggregate_root/common_class.dart';

abstract interface class CommonClassRepository {
  Future<CommonClass?> find({required String key});
  Future<List<CommonClass>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save({required CommonClass commonClass});
  Future<void> delete({required String key});
}''')
@AggregateRoot()
class CommonClass {
  final String name;
  const CommonClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
}
