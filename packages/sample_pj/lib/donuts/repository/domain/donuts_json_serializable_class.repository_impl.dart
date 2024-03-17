// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/donuts_json_serializable_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/repository/api/domain/donuts_json_serializable_class.abstract_interface_api.dart';

class DonutsJsonSerializableClassRepositoryImpl
    implements DonutsJsonSerializableClassRepository {
  DonutsJsonSerializableClassRepositoryImpl({required this.api});

  final DonutsJsonSerializableClassApi api;

  @override
  Future<DonutsJsonSerializableClass?> find({required String key}) async {
    return api.find(key: key);
  }

  @override
  Future<List<DonutsJsonSerializableClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return api.all(
      cursor: cursor,
      length: length,
    );
  }

  @override
  Future<void> save(
      {required DonutsJsonSerializableClass
          donutsJsonSerializableClass}) async {
    api.save(donutsJsonSerializableClass: donutsJsonSerializableClass);
  }

  @override
  Future<void> delete({required String key}) async {
    api.delete(key: key);
  }
}

class DonutsJsonSerializableClassRepositoryException implements Exception {
  const DonutsJsonSerializableClassRepositoryException(String message)
      : message = "[DonutsJsonSerializableClassRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
