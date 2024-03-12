// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/apple/apple.application_service_provider.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

final appleSingleStateImplProvider =
    AsyncNotifierProvider<AppleSingleStateImpl, Apple?>(
        AppleSingleStateImpl.new);

class AppleSingleStateImpl extends AsyncNotifier<Apple?> {
  // ignore: unused_field
  FruitsId? _id;

  @override
  Future<Apple?> build() async {
    return null;
  }

  Future<Apple?> set({required FruitsId id}) async {
    state = const AsyncValue.loading();
    final service = ref.watch(appleApplicationServiceProvider);
    final (target, err) = await service.find(id: id);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return null;
    }
    if (target == null) {
      _id = null;
      state = const AsyncValue.data(null);
      return null;
    }
    _id = id;
    state = AsyncValue.data(target);
    return target;
  }
}
