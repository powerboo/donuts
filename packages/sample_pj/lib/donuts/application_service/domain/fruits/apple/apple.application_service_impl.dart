// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/apple/apple.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/apple/apple.abstract_interface_application_service.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class AppleApplicationServiceImpl implements AppleApplicationService {
  AppleApplicationServiceImpl({
    required AppleFactory appleFactory,
    required AppleRepository appleRepository,
  })  : _appleFactory = appleFactory,
        _appleRepository = appleRepository;

  final AppleFactory _appleFactory;

  final AppleRepository _appleRepository;

  @override
  Future<(Apple?, DonutsError?)> create({required String apple}) async {
    try {
      final created = _appleFactory.create(
        apple: apple,
      );
      await _appleRepository.save(apple: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(Apple?, DonutsError?)> find({required FruitsId id}) async {
    try {
      final target = await _appleRepository.find(id: id);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> save({required Apple apple}) async {
    try {
      await _appleRepository.save(apple: apple);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> delete({required FruitsId id}) async {
    try {
      await _appleRepository.delete(id: id);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(List<Apple>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target = await _appleRepository.all(cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }
}

class AppleApplicationServiceImplException implements Exception {
  const AppleApplicationServiceImplException(String message)
      : message = "[AppleApplicationServiceImplException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
