// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// SingleStateGenerator
// **************************************************************************

import 'package:riverpod/riverpod.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/orange/orange.application_service_provider.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

final orangeSingleStateImplProvider =
    AsyncNotifierProvider<OrangeSingleStateImpl, Orange?>(
        OrangeSingleStateImpl.new);

class OrangeSingleStateImpl extends AsyncNotifier<Orange?> {
  // ignore: unused_field
  FruitsId? _id;

  @override
  Future<Orange?> build() async {
    return null;
  }

  Future<Orange?> set({required FruitsId id}) async {
    state = const AsyncValue.loading();
    final service = ref.watch(orangeApplicationServiceProvider);
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
