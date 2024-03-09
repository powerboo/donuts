// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InMemoryRepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/repository/domain/donuts_json_serializable_class.abstract_interface_repository.dart';

class InMemoryDonutsJsonSerializableClassRepositoryImpl
    implements DonutsJsonSerializableClassRepository {
  List<DonutsJsonSerializableClass> store = [];

  @override
  Future<DonutsJsonSerializableClass?> find({required String key}) async {
    return store.where((s) => s.key == key).firstOrNull;
  }

  @override
  Future<List<DonutsJsonSerializableClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  @override
  Future<void> save(
      {required DonutsJsonSerializableClass
          donutsJsonSerializableClass}) async {
    if (await find(key: donutsJsonSerializableClass.key) == null) {
      store = [...store, donutsJsonSerializableClass];
    } else {
      final deleted =
          store.where((s) => s.key != donutsJsonSerializableClass.key).toList();
      store = [...deleted, donutsJsonSerializableClass];
    }
  }

  @override
  Future<void> delete({required String key}) async {
    store = store.where((s) => s.key != key).toList();
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
