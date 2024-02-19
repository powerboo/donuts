import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/donuts/application_service/common_class_application_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonClassListStateImplProvider =
    AsyncNotifierProvider<CommonClassListStateImpl, List<CommonClass>>(CommonClassListStateImpl.new);

class CommonClassListStateImpl extends AsyncNotifier<List<CommonClass>> {
  @override
  Future<List<CommonClass>> build() async {
    return [];
  }

  Future<CommonClass> create() async {
    return ref.read();
  }
}''')

/*
  Future<(CommonClass?, ErrorMessage?)> find({required String key}) async {
  }

  Future<(void, ErrorMessage?)> save({required CommonClass commonClass}) async {
  }

  Future<(void, ErrorMessage?)> delete({required String key}) async {
  }

  Future<(List<CommonClass>?, ErrorMessage?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
  }

  Future<CommonClass> method1() async {
  }
  
  /// doc method 2
  Future<CommonClass> method2(
    String val, {
    required int number,
  }) async {}

 */
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
