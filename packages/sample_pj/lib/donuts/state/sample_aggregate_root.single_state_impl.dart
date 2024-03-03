// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/application_service/sample_aggregate_root.application_service_provider.dart';

final sampleAggregateRootSingleStateImplProvider = AsyncNotifierProvider<
    SampleAggregateRootSingleStateImpl,
    SampleAggregateRoot?>(SampleAggregateRootSingleStateImpl.new);

class SampleAggregateRootSingleStateImpl
    extends AsyncNotifier<SampleAggregateRoot?> {
  // ignore: unused_field
  ObjectId? _key;

  @override
  Future<SampleAggregateRoot?> build() async {
    return null;
  }

  Future<SampleAggregateRoot?> set({required ObjectId key}) async {
    state = const AsyncValue.loading();
    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
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

  /// method 1
  Future<void> method1() async {
    state = const AsyncValue.loading();
    final key = _key;
    if (key == null) {
      state = AsyncValue.error(
          "[SampleAggregateRootSingleStateImplError] key is null.",
          StackTrace.current);
      return;
    }
    final service = ref.watch(sampleAggregateRootApplicationServiceProvider);
    final (changed, err) = await service.method1(
      key: key,
    );
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (changed == null) {
      state = AsyncValue.error(
          "[SampleAggregateRootSingleStateImplError] Failed to execute [method1]. key[$key]",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(changed);
  }
}
