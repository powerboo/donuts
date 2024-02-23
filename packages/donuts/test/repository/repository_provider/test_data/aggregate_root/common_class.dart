import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:__test__/donuts/repository/common_class_repository.dart';
import 'package:__test__/donuts/repository/common_class_repository_impl.dart';

final commonClassRepositoryProvider = Provider<CommonClassRepository>((ref) {
  const bool inMemory = false;
  if (inMemory) {
    return InMemoryCommonClassRepositoryImpl(store: []);
  }
  return CommonClassRepositoryImpl();
});''')
@AggregateRoot()
class CommonClass {
  final String name;
  const CommonClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
  CommonClass method1() {
    throw ();
  }

  /// doc method 2
  CommonClass method2(
    String val, {
    required int number,
  }) {
    throw ();
  }
}
