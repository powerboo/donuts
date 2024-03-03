// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/freezed_class.dart';
import 'package:sample_pj/donuts/application_service/freezed_class.application_service_provider.dart';

final freezedClassListStateImplProvider =
    AsyncNotifierProvider<FreezedClassListStateImpl, List<FreezedClass>>(
        FreezedClassListStateImpl.new);

class FreezedClassListStateImpl extends AsyncNotifier<List<FreezedClass>> {
  Future<void> _fetchAll() async {
    final service = ref.watch(freezedClassApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[FreezedClassListStateImplError] freezedClass is null.",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<FreezedClass>> build() async {
    state = const AsyncValue.loading();

    final service = ref.watch(freezedClassApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[FreezedClassListStateImplError] freezedClass is null.",
          StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create(
    int intValue,
    int? nullableInt, {
    required String freezedClass,
    String? nullableString,
  }) async {
    state = const AsyncValue.loading();

    final service = ref.watch(freezedClassApplicationServiceProvider);
    final (created, err) = await service.create(
      intValue,
      nullableInt,
      freezedClass: freezedClass,
      nullableString: nullableString,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (created == null) {
      state = AsyncValue.error(
          "[FreezedClassListStateImplError] freezedClass is null.",
          StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<FreezedClass?> find({required String key}) async {
    final service = ref.watch(freezedClassApplicationServiceProvider);
    final (freezedClass, err) = await service.find(key: key);
    if (err != null) {
      return null;
    }
    return freezedClass;
  }

  Future<void> delete({required String key}) async {
    final service = ref.watch(freezedClassApplicationServiceProvider);
    final (_, err) = await service.delete(key: key);
    if (err != null) {
      return;
    }
    await _fetchAll();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _fetchAll();
  }
}
