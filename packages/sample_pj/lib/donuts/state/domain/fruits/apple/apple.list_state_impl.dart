// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/apple/apple.application_service_provider.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

final appleListStateImplProvider =
    AsyncNotifierProvider<AppleListStateImpl, List<Apple>>(
        AppleListStateImpl.new);

class AppleListStateImpl extends AsyncNotifier<List<Apple>> {
  Future<void> _fetchAll() async {
    final service = ref.watch(appleApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[AppleListStateImplError] apple is null.", StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<Apple>> build() async {
    state = const AsyncValue.loading();

    final service = ref.watch(appleApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[AppleListStateImplError] apple is null.", StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create({required String apple}) async {
    state = const AsyncValue.loading();

    final service = ref.watch(appleApplicationServiceProvider);
    final (created, err) = await service.create(
      apple: apple,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (created == null) {
      state = AsyncValue.error(
          "[AppleListStateImplError] apple is null.", StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<Apple?> find({required FruitsId id}) async {
    final service = ref.watch(appleApplicationServiceProvider);
    final (apple, err) = await service.find(id: id);
    if (err != null) {
      return null;
    }
    return apple;
  }

  Future<void> delete({required FruitsId id}) async {
    final service = ref.watch(appleApplicationServiceProvider);
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
