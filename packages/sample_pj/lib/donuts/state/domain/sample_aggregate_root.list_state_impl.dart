// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/application_service/domain/sample_aggregate_root.application_service_provider.dart';

final sampleAggregateRootListStateImplProvider = AsyncNotifierProvider<
    SampleAggregateRootListStateImpl,
    List<SampleAggregateRoot>>(SampleAggregateRootListStateImpl.new);

class SampleAggregateRootListStateImpl
    extends AsyncNotifier<List<SampleAggregateRoot>> {
  Future<void> _fetchAll() async {
    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[SampleAggregateRootListStateImplError] sampleAggregateRoot is null.",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<SampleAggregateRoot>> build() async {
    state = const AsyncValue.loading();

    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
    final (list, err) = await service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[SampleAggregateRootListStateImplError] sampleAggregateRoot is null.",
          StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create({required String value}) async {
    state = const AsyncValue.loading();

    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
    final (created, err) = await service.create(
      value: value,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (created == null) {
      state = AsyncValue.error(
          "[SampleAggregateRootListStateImplError] sampleAggregateRoot is null.",
          StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<SampleAggregateRoot?> find({required ObjectId key}) async {
    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
    final (sampleAggregateRoot, err) = await service.find(key: key);
    if (err != null) {
      return null;
    }
    return sampleAggregateRoot;
  }

  Future<void> delete({required ObjectId key}) async {
    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
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
