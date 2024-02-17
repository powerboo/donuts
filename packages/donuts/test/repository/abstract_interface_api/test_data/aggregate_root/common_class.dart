import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/aggregate_root/common_class.dart';
import 'package:__test__/donuts/repository/common_class_repository.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';

@ConvertTargetClass()
abstract class CommonClassApi implements CommonClassRepository{
  @ConvertTargetMethod()
  Future<CommonClass?> find({required String key});
  @ConvertTargetMethod()
  Future<List<CommonClass>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod()
  Future<void> save({required CommonClass commonClass});
  @ConvertTargetMethod()
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
