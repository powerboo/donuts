import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:__test__/aggregate_root/common_class.dart';
import 'package:__test__/donuts/application_service/common_class_application_service_provider.dart';

final commonClassListStateImplProvider =
    AsyncNotifierProvider<CommonClassListStateImpl, List<CommonClass>>(
        CommonClassListStateImpl.new);

class CommonClassListStateImpl extends AsyncNotifier<List<CommonClass>> {
  final _service = ref.watch(commonClassApplicationServiceProvider);

  Future<void> _fetchAll() async {
    final (list, err) = await _service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (list == null) {
      state = AsyncValue.error(
          "[CommonClassListStateImplError] commonClass is null.",
          StackTrace.current);
      return;
    }
    state = AsyncValue.data(list);
  }

  @override
  Future<List<CommonClass>> build() async {
    state = AsyncValue.load();
    final (list, err) = _service.all();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return [];
    }
    if (list == null) {
      state = AsyncValue.error(
          "[CommonClassListStateImplError] commonClass is null.",
          StackTrace.current);
      return [];
    }
    return list;
  }

  Future<void> create() async {
    state = AsyncValue.load();
    final (commonClass, err) = await service.create();
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    if (commonClass == null) {
      state = AsyncValue.error(
          "[CommonClassListStateImplError] commonClass is null.",
          StackTrace.current);
      return;
    }
    await _fetchAll();
  }

  Future<CommonClass?> find() async {
    state = AsyncValue.load();
    final (commonClass, err) = await service.find(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    return commonClass;
  }

  Future<void> delete() async {
    state = AsyncValue.load();
    final (_, err) = await service.delete(key: key);
    if (err != null) {
      state = AsyncValue.error(err.error, err.stackTrace);
      return;
    }
    await _fetchAll();
  }

  Future<void> refresh() async {
    state = AsyncValue.load();
    await _fetchAll();
  }
}''')

/*
  Future<void> delete({required String key}) async {

  Future<CommonClass> method1() async {
  }
  
  /// doc method 2
  Future<CommonClass> method2(
    String val, {
    required int number,
  }) async {}

 */
@AggregateRoot()
class CommonClass {
  final String name;
  const CommonClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
  CommonClass method1() {
    throw ();
  }

  /// doc method 2
  CommonClass method2(
    String val, {
    required int number,
  }) {
    try {} catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
    throw ();
  }
}
