// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/factory/domain/fruits/orange/orange.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/application_service/domain/fruits/orange/orange.abstract_interface_application_service.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class OrangeApplicationServiceImpl implements OrangeApplicationService {
  OrangeApplicationServiceImpl({
    required OrangeFactory orangeFactory,
    required OrangeRepository orangeRepository,
  })  : _orangeFactory = orangeFactory,
        _orangeRepository = orangeRepository;

  final OrangeFactory _orangeFactory;

  final OrangeRepository _orangeRepository;

  @override
  Future<(Orange?, DonutsError?)> create({required String name}) async {
    try {
      final created = _orangeFactory.create(
        name: name,
      );
      await _orangeRepository.save(orange: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(Orange?, DonutsError?)> find({required FruitsId id}) async {
    try {
      final target = await _orangeRepository.find(id: id);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> save({required Orange orange}) async {
    try {
      await _orangeRepository.save(orange: orange);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> delete({required FruitsId id}) async {
    try {
      await _orangeRepository.delete(id: id);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(List<Orange>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target =
          await _orangeRepository.all(cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }
}

class OrangeApplicationServiceImplException implements Exception {
  const OrangeApplicationServiceImplException(String message)
      : message = "[OrangeApplicationServiceImplException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
