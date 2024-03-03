// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/factory/donuts_json_serializable_class.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/repository/donuts_json_serializable_class.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/application_service/donuts_json_serializable_class.abstract_interface_application_service.dart';

class DonutsJsonSerializableClassApplicationServiceImpl
    implements DonutsJsonSerializableClassApplicationService {
  DonutsJsonSerializableClassApplicationServiceImpl({
    required DonutsJsonSerializableClassFactory
        donutsJsonSerializableClassFactory,
    required DonutsJsonSerializableClassRepository
        donutsJsonSerializableClassRepository,
  })  : _donutsJsonSerializableClassFactory =
            donutsJsonSerializableClassFactory,
        _donutsJsonSerializableClassRepository =
            donutsJsonSerializableClassRepository;

  final DonutsJsonSerializableClassFactory _donutsJsonSerializableClassFactory;

  final DonutsJsonSerializableClassRepository
      _donutsJsonSerializableClassRepository;

  @override
  Future<(DonutsJsonSerializableClass?, DonutsError?)> create(
    String? nullableString, {
    bool? isOk,
  }) async {
    try {
      final created = _donutsJsonSerializableClassFactory.create(
        nullableString,
        isOk: isOk,
      );
      await _donutsJsonSerializableClassRepository.save(
          donutsJsonSerializableClass: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(DonutsJsonSerializableClass?, DonutsError?)> find(
      {required String key}) async {
    try {
      final target =
          await _donutsJsonSerializableClassRepository.find(key: key);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> save(
      {required DonutsJsonSerializableClass
          donutsJsonSerializableClass}) async {
    try {
      await _donutsJsonSerializableClassRepository.save(
          donutsJsonSerializableClass: donutsJsonSerializableClass);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  Future<(void, DonutsError?)> delete({required String key}) async {
    try {
      await _donutsJsonSerializableClassRepository.delete(key: key);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(List<DonutsJsonSerializableClass>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target = await _donutsJsonSerializableClassRepository.all(
          cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }
}

class DonutsJsonSerializableClassApplicationServiceImplException
    implements Exception {
  const DonutsJsonSerializableClassApplicationServiceImplException(
      String message)
      : message =
            "[DonutsJsonSerializableClassApplicationServiceImplException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
