// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/repository/api/domain/fruits/apple/apple.abstract_interface_api.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class AppleRepositoryImpl implements AppleRepository {
  AppleRepositoryImpl({required this.api});

  final AppleApi api;

  @override
  Future<Apple?> find({required FruitsId id}) async {
    return api.find(id: id);
  }

  @override
  Future<List<Apple>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return api.all(
      cursor: cursor,
      length: length,
    );
  }

  @override
  Future<void> save({required Apple apple}) async {
    api.save(apple: apple);
  }

  @override
  Future<void> delete({required FruitsId id}) async {
    api.delete(id: id);
  }
}

class AppleRepositoryException implements Exception {
  const AppleRepositoryException(String message)
      : message = "[AppleRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
