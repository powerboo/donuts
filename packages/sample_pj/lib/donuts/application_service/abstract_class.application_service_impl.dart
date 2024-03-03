// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/abstract_class.dart';
import 'package:sample_pj/donuts/factory/abstract_class.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/repository/abstract_class.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/application_service/abstract_class.abstract_interface_application_service.dart';

@override
@override
class AbstractClassApplicationServiceImpl
    implements AbstractClassApplicationService {
  AbstractClassApplicationServiceImpl({
    required AbstractClassFactory abstractClassFactory,
    required AbstractClassRepository abstractClassRepository,
  })  : _abstractClassFactory = abstractClassFactory,
        _abstractClassRepository = abstractClassRepository;

  final AbstractClassFactory _abstractClassFactory;

  final AbstractClassRepository _abstractClassRepository;

  @override
  Future<(AbstractClass?, DonutsError?)> create() async {
    try {
      final created = _abstractClassFactory.create();
      await _abstractClassRepository.save(abstractClass: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(AbstractClass?, DonutsError?)> find({required String key}) async {
    try {
      final target = await _abstractClassRepository.find(key: key);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> save(
      {required AbstractClass abstractClass}) async {
    try {
      await _abstractClassRepository.save(abstractClass: abstractClass);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  Future<(void, DonutsError?)> delete({required String key}) async {
    try {
      await _abstractClassRepository.delete(key: key);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(List<AbstractClass>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target =
          await _abstractClassRepository.all(cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  /// method1
  Future<(AbstractClass?, DonutsError?)> commonMethod1(
      {required String key}) async {
    try {
      final target = await _abstractClassRepository.find(key: key);
      if (target == null) {
        throw AbstractClassApplicationServiceImplException(
            "[commonMethod1]target is null.${key}");
      }

      // method1
      final changed = target.commonMethod1();

      await _abstractClassRepository.save(abstractClass: changed);
      return (changed, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  /// method2
  Future<(AbstractClass?, DonutsError?)> commonMethod2({
    required String key,
    required int intValue,
  }) async {
    try {
      final target = await _abstractClassRepository.find(key: key);
      if (target == null) {
        throw AbstractClassApplicationServiceImplException(
            "[commonMethod2]target is null.${key}");
      }

      // method2
      final changed = target.commonMethod2(
        intValue: intValue,
      );

      await _abstractClassRepository.save(abstractClass: changed);
      return (changed, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }
}

class AbstractClassApplicationServiceImplException implements Exception {
  const AbstractClassApplicationServiceImplException(String message)
      : message = "[AbstractClassApplicationServiceImplException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
