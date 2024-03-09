// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/application_service/domain/donuts_json_serializable_class.application_service_provider.dart';

final donutsJsonSerializableClassSingleStateImplProvider =
    AsyncNotifierProvider<DonutsJsonSerializableClassSingleStateImpl,
            DonutsJsonSerializableClass?>(
        DonutsJsonSerializableClassSingleStateImpl.new);

class DonutsJsonSerializableClassSingleStateImpl
    extends AsyncNotifier<DonutsJsonSerializableClass?> {
  // ignore: unused_field
  String? _key;

  @override
  Future<DonutsJsonSerializableClass?> build() async {
    return null;
  }

  Future<DonutsJsonSerializableClass?> set({required String key}) async {
    state = const AsyncValue.loading();
    final service =
        ref.watch(donutsJsonSerializableClassApplicationServiceProvider);
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
