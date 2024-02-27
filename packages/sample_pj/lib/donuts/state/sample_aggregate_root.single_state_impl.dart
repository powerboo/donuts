// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_pj/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/application_service/sample_aggregate_root.application_service_provider.dart';

final sampleAggregateRootSingleStateImplProvider = AsyncNotifierProvider<
    SampleAggregateRootSingleStateImpl,
    SampleAggregateRoot?>(SampleAggregateRootSingleStateImpl.new);

class SampleAggregateRootSingleStateImpl
    extends AsyncNotifier<SampleAggregateRoot?> {
  final _service = ref.watch(sampleAggregateRootApplicationServiceProvider);

  String? _key;

  @override
  Future<SampleAggregateRoot?> build() async {
    return null;
  }

  Future<SampleAggregateRoot?> set() async {
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
    final (changed, err) = await _service.method1(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (changed == null) {
      state = AsyncValue.error(
          "[SampleAggregateRootSingleStateImplError] Failed to execute [method1]. key[${key}]",
          StackTrace.current);
      return;
    }
    state = changed;
  }
}
