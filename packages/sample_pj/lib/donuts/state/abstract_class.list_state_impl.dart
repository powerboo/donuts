// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/abstract_class.dart';
import 'package:sample_pj/donuts/application_service/abstract_class.application_service_provider.dart';

final abstractClassListStateImplProvider =
    AsyncNotifierProvider<AbstractClassListStateImpl, List<AbstractClass>>(
        AbstractClassListStateImpl.new);

class AbstractClassListStateImpl extends AsyncNotifier<List<AbstractClass>> {
  Future<void> _fetchAll() async {
    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[AbstractClassListStateImplError] abstractClass is null.",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<AbstractClass>> build() async {
    state = const AsyncValue.loading();

    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[AbstractClassListStateImplError] abstractClass is null.",
          StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create() async {
    state = const AsyncValue.loading();

    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (created, err) = await service.create();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (created == null) {
      state = AsyncValue.error(
          "[AbstractClassListStateImplError] abstractClass is null.",
          StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<AbstractClass?> find({required String key}) async {
    final service = ref.watch(abstractClassApplicationServiceProvider);
    final (abstractClass, err) = await service.find(key: key);
    if (err != null) {
      return null;
    }
    return abstractClass;
  }

  Future<void> delete({required String key}) async {
    final service = ref.watch(abstractClassApplicationServiceProvider);
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
