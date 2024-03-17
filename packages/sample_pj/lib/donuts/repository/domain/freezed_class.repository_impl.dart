// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/freezed_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/freezed_class.dart';
import 'package:sample_pj/donuts/repository/api/domain/freezed_class.abstract_interface_api.dart';

class FreezedClassRepositoryImpl implements FreezedClassRepository {
  FreezedClassRepositoryImpl({required this.api});

  final FreezedClassApi api;

  @override
  Future<FreezedClass?> find({required String key}) async {
    return api.find(key: key);
  }

  @override
  Future<List<FreezedClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return api.all(
      cursor: cursor,
      length: length,
    );
  }

  @override
  Future<void> save({required FreezedClass freezedClass}) async {
    api.save(freezedClass: freezedClass);
  }

  @override
  Future<void> delete({required String key}) async {
    api.delete(key: key);
  }
}

class FreezedClassRepositoryException implements Exception {
  const FreezedClassRepositoryException(String message)
      : message = "[FreezedClassRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
