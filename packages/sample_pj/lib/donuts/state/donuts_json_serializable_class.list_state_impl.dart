// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/application_service/donuts_json_serializable_class.application_service_provider.dart';

final donutsJsonSerializableClassListStateImplProvider = AsyncNotifierProvider<
        DonutsJsonSerializableClassListStateImpl,
        List<DonutsJsonSerializableClass>>(
    DonutsJsonSerializableClassListStateImpl.new);

class DonutsJsonSerializableClassListStateImpl
    extends AsyncNotifier<List<DonutsJsonSerializableClass>> {
  Future<void> _fetchAll() async {
    final service =
        ref.watch(donutsJsonSerializableClassApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[DonutsJsonSerializableClassListStateImplError] donutsJsonSerializableClass is null.",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<DonutsJsonSerializableClass>> build() async {
    state = const AsyncValue.loading();

    final service =
        ref.watch(donutsJsonSerializableClassApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[DonutsJsonSerializableClassListStateImplError] donutsJsonSerializableClass is null.",
          StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create(
    String? nullableString, {
    bool? isOk,
  }) async {
    state = const AsyncValue.loading();

    final service =
        ref.watch(donutsJsonSerializableClassApplicationServiceProvider);
    final (created, err) = await service.create(
      nullableString,
      isOk: isOk,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (created == null) {
      state = AsyncValue.error(
          "[DonutsJsonSerializableClassListStateImplError] donutsJsonSerializableClass is null.",
          StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<DonutsJsonSerializableClass?> find({required String key}) async {
    final service =
        ref.watch(donutsJsonSerializableClassApplicationServiceProvider);
    final (donutsJsonSerializableClass, err) = await service.find(key: key);
    if (err != null) {
      return null;
    }
    return donutsJsonSerializableClass;
  }

  Future<void> delete({required String key}) async {
    final service =
        ref.watch(donutsJsonSerializableClassApplicationServiceProvider);
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
