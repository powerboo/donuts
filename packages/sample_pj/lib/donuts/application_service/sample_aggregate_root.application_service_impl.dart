// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApplicationServiceImplGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/factory/sample_aggregate_root.abstract_interface_factory.dart';
import 'package:sample_pj/donuts/repository/sample_aggregate_root.abstract_interface_repository.dart';
import 'package:sample_pj/donuts/application_service/sample_aggregate_root.abstract_interface_application_service.dart';

@override
class SampleAggregateRootApplicationServiceImpl
    implements SampleAggregateRootApplicationService {
  SampleAggregateRootApplicationServiceImpl({
    required SampleAggregateRootFactory sampleAggregateRootFactory,
    required SampleAggregateRootRepository sampleAggregateRootRepository,
  })  : _sampleAggregateRootFactory = sampleAggregateRootFactory,
        _sampleAggregateRootRepository = sampleAggregateRootRepository;

  final SampleAggregateRootFactory _sampleAggregateRootFactory;

  final SampleAggregateRootRepository _sampleAggregateRootRepository;

  @override
  Future<(SampleAggregateRoot?, DonutsError?)> create(
      {required String value}) async {
    try {
      final created = _sampleAggregateRootFactory.create(
        value: value,
      );
      await _sampleAggregateRootRepository.save(sampleAggregateRoot: created);
      return (created, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(SampleAggregateRoot?, DonutsError?)> find(
      {required ObjectId key}) async {
    try {
      final target = await _sampleAggregateRootRepository.find(key: key);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(void, DonutsError?)> save(
      {required SampleAggregateRoot sampleAggregateRoot}) async {
    try {
      await _sampleAggregateRootRepository.save(
          sampleAggregateRoot: sampleAggregateRoot);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  Future<(void, DonutsError?)> delete({required ObjectId key}) async {
    try {
      await _sampleAggregateRootRepository.delete(key: key);
      return (null, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  @override
  Future<(List<SampleAggregateRoot>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  }) async {
    try {
      final target = await _sampleAggregateRootRepository.all(
          cursor: cursor, length: length);
      return (target, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }

  /// method 1
  Future<(SampleAggregateRoot?, DonutsError?)> method1(
      {required ObjectId key}) async {
    try {
      final target = await _sampleAggregateRootRepository.find(key: key);
      if (target == null) {
        throw SampleAggregateRootApplicationServiceImplException(
            "[method1]target is null.${key}");
      }

      // method 1
      final changed = target.method1();

      await _sampleAggregateRootRepository.save(sampleAggregateRoot: changed);
      return (changed, null);
    } catch (e, stacktrace) {
      return (null, DonutsError(e, stacktrace));
    }
  }
}

class SampleAggregateRootApplicationServiceImplException implements Exception {
  const SampleAggregateRootApplicationServiceImplException(String message)
      : message =
            "[SampleAggregateRootApplicationServiceImplException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
