// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/orange/orange.application_service_provider.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

final orangeListStateImplProvider =
    AsyncNotifierProvider<OrangeListStateImpl, List<Orange>>(
        OrangeListStateImpl.new);

class OrangeListStateImpl extends AsyncNotifier<List<Orange>> {
  Future<void> _fetchAll() async {
    final service = ref.watch(orangeApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[OrangeListStateImplError] orange is null.", StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<Orange>> build() async {
    state = const AsyncValue.loading();

    final service = ref.watch(orangeApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[OrangeListStateImplError] orange is null.", StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create({required String name}) async {
    state = const AsyncValue.loading();

    final service = ref.watch(orangeApplicationServiceProvider);
    final (created, err) = await service.create(
      name: name,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (created == null) {
      state = AsyncValue.error(
          "[OrangeListStateImplError] orange is null.", StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<Orange?> find({required FruitsId id}) async {
    final service = ref.watch(orangeApplicationServiceProvider);
    final (orange, err) = await service.find(id: id);
    if (err != null) {
      return null;
    }
    return orange;
  }

  Future<void> delete({required FruitsId id}) async {
    final service = ref.watch(orangeApplicationServiceProvider);
    final (_, err) = await service.delete(id: id);
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
