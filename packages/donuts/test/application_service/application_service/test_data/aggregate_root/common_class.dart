import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:donuts_annotation/error.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:__test__/aggregate_root/common_class.dart';
import 'package:__test__/donuts/factory/common_class_factory.dart';
import 'package:__test__/donuts/repository/common_class_repository.dart';

class CommonClassApplicationServiceImpl {
  CommonClassApplicationServiceImpl({
    required CommonClassFactory commonClassFactory,
    required CommonClassRepository commonClassRepository,
    required this.ref,
  })  : _commonClassFactory = commonClassFactory,
        _commonClassRepository = commonClassRepository;

  final CommonClassFactory _commonClassFactory;

  final CommonClassRepository _commonClassRepository;

  final AsyncNotifierProviderRef<dynamic> ref;

  Future<(CommonClass?, ErrorMessage?)> create() async {
    try {
      final created = _commonClassFactory.create();
      await _commonClassRepository.save(commonClass: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, Error(e, stacktrace));
    }
  }

  Future<(void, ErrorMessage?)> delete({required String key}) async {
    try {
      await _commonClassRepository.delete(key: key);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, Error(e, stacktrace));
    }
  }

  Future<(List<CommonClass>?, ErrorMessage?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target =
          await _commonClassRepository.all(cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, Error(e, stacktrace));
    }
  }

  Future<(CommonClass?, ErrorMessage?)> method1({required String key}) async {
    try {
      final target = await _commonClassRepository.find(key: key);
      if (target == null) {
        throw CommonClassApplicationServiceImplException(
            "[method1]target is null.\${key}");
      }

      final changed = target.method1();

      await _commonClassRepository.save(commonClass: changed);
      return (changed, null);
    } catch (e, stacktrace) {
      return (null, Error(e, stacktrace));
    }
  }

  /// doc method 2
  Future<(CommonClass?, ErrorMessage?)> method2(
    String val, {
    required String key,
    required int number,
  }) async {
    try {
      final target = await _commonClassRepository.find(key: key);
      if (target == null) {
        throw CommonClassApplicationServiceImplException(
            "[method2]target is null.\${key}");
      }

      // doc method 2
      final changed = target.method2();

      await _commonClassRepository.save(commonClass: changed);
      return (changed, null);
    } catch (e, stacktrace) {
      return (null, Error(e, stacktrace));
    }
  }
}

class CommonClassApplicationServiceImplException implements Exception {
  CommonClassApplicationServiceImplException(this.message)
      : this.message = "[CommonClassApplicationServiceImplException]\$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}''')
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
    throw ();
  }
}

/*
 */