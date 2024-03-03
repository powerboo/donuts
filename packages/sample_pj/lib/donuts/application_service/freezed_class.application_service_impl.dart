// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/freezed_class.dart';
import 'package:sample_pj/donuts/factory/freezed_class.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/repository/freezed_class.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/application_service/freezed_class.abstract_interface_application_service.dart';

class FreezedClassApplicationServiceImpl
    implements FreezedClassApplicationService {
  FreezedClassApplicationServiceImpl({
    required FreezedClassFactory freezedClassFactory,
    required FreezedClassRepository freezedClassRepository,
  })  : _freezedClassFactory = freezedClassFactory,
        _freezedClassRepository = freezedClassRepository;

  final FreezedClassFactory _freezedClassFactory;

  final FreezedClassRepository _freezedClassRepository;

  @override
  Future<(FreezedClass?, DonutsError?)> create(
    int intValue,
    int? nullableInt, {
    required String freezedClass,
    String? nullableString,
  }) async {
    try {
      final created = _freezedClassFactory.create(
        intValue,
        nullableInt,
        freezedClass: freezedClass,
        nullableString: nullableString,
      );
      await _freezedClassRepository.save(freezedClass: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(FreezedClass?, DonutsError?)> find({required String key}) async {
    try {
      final target = await _freezedClassRepository.find(key: key);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> save(
      {required FreezedClass freezedClass}) async {
    try {
      await _freezedClassRepository.save(freezedClass: freezedClass);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  Future<(void, DonutsError?)> delete({required String key}) async {
    try {
      await _freezedClassRepository.delete(key: key);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(List<FreezedClass>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target =
          await _freezedClassRepository.all(cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }
}

class FreezedClassApplicationServiceImplException implements Exception {
  const FreezedClassApplicationServiceImplException(String message)
      : message = "[FreezedClassApplicationServiceImplException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
