import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:__test__/aggregate_root/common_class.dart';
import 'package:__test__/donuts/application_service/common_class_application_service_provider.dart';

final commonClassSingleStateImplProvider =
    AsyncNotifierProvider<CommonClassSingleStateImpl, CommonClass?>(
        CommonClassSingleStateImpl.new);

class CommonClassSingleStateImpl extends AsyncNotifier<CommonClass?> {
  final _service = ref.watch(commonClassApplicationServiceProvider);

  String? _key;

  @override
  Future<CommonClass?> build() async {
    return null;
  }

  Future<CommonClass?> set() async {
    state = const AsyncValue.loading();
    final (target, err) = await _service.find(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return null;
    }
    if (target == null) {
      _key = null;
      state = null;
      return null;
    }
    _key = key;
    state = AsyncValue.data(target);
    return target;
  }

  Future<void> method1() async {
    state = const AsyncValue.loading();
    final key = _key;
    if (key == null) {
      state = AsyncValue.error(
          "[CommonClassSingleStateImplError] key is null.", StackTrace.current);
      return;
    }
    final (changed, err) = await _service.method1(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (changed == null) {
      state = AsyncValue.error(
          "[CommonClassSingleStateImplError] Failed to execute [method1]. key[\${key}]",
          StackTrace.current);
      return;
    }
    state = changed;
  }

  /// doc method 2
  Future<void> method2() async {
    state = const AsyncValue.loading();
    final key = _key;
    if (key == null) {
      state = AsyncValue.error(
          "[CommonClassSingleStateImplError] key is null.", StackTrace.current);
      return;
    }
    final (changed, err) = await _service.method2(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (changed == null) {
      state = AsyncValue.error(
          "[CommonClassSingleStateImplError] Failed to execute [method2]. key[\${key}]",
          StackTrace.current);
      return;
    }
    state = changed;
  }
}''')
/*
  Future<CommonClass?> set({required String key}) async {
  /// doc method 2
  Future<void> method2(
    String val, {
    required int number,
  }) async {

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
    try {} catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
    throw ();
  }
}
