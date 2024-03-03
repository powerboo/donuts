// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/abstract_class.dart';
import 'package:sample_pj/donuts/application_service/abstract_class.application_service_provider.dart';

final abstractClassSingleStateImplProvider =
    AsyncNotifierProvider<AbstractClassSingleStateImpl, AbstractClass?>(
        AbstractClassSingleStateImpl.new);

class AbstractClassSingleStateImpl extends AsyncNotifier<AbstractClass?> {
  // ignore: unused_field
  String? _key;

  @override
  Future<AbstractClass?> build() async {
    return null;
  }

  Future<AbstractClass?> set({required String key}) async {
    state = const AsyncValue.loading();
    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (target, err) = await service.find(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return null;
    }
    if (target == null) {
      _key = null;
      state = const AsyncValue.data(null);
      return null;
    }
    _key = key;
    state = AsyncValue.data(target);
    return target;
  }

  /// method1
  Future<void> commonMethod1() async {
    state = const AsyncValue.loading();
    final key = _key;
    if (key == null) {
      state = AsyncValue.error(
          "[AbstractClassSingleStateImplError] key is null.",
          StackTrace.current);
      return;
    }
    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (changed, err) = await service.commonMethod1(
      key: key,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (changed == null) {
      state = AsyncValue.error(
          "[AbstractClassSingleStateImplError] Failed to execute [commonMethod1]. key[$key]",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(changed);
  }

  /// method2
  Future<void> commonMethod2({required int intValue}) async {
    state = const AsyncValue.loading();
    final key = _key;
    if (key == null) {
      state = AsyncValue.error(
          "[AbstractClassSingleStateImplError] key is null.",
          StackTrace.current);
      return;
    }
    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (changed, err) = await service.commonMethod2(
      intValue: intValue,
      key: key,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (changed == null) {
      state = AsyncValue.error(
          "[AbstractClassSingleStateImplError] Failed to execute [commonMethod2]. key[$key]",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(changed);
  }
}
