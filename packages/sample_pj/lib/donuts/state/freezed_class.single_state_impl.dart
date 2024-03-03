// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/freezed_class.dart';
import 'package:sample_pj/donuts/application_service/freezed_class.application_service_provider.dart';

final freezedClassSingleStateImplProvider =
    AsyncNotifierProvider<FreezedClassSingleStateImpl, FreezedClass?>(
        FreezedClassSingleStateImpl.new);

class FreezedClassSingleStateImpl extends AsyncNotifier<FreezedClass?> {
  // ignore: unused_field
  String? _key;

  @override
  Future<FreezedClass?> build() async {
    return null;
  }

  Future<FreezedClass?> set({required String key}) async {
    state = const AsyncValue.loading();
    final service = ref.watch(freezedClassApplicationServiceProvider);
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
}
