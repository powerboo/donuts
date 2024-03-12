// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InMemoryRepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class InMemoryOrangeRepositoryImpl implements OrangeRepository {
  List<Orange> store = [];

  @override
  Future<Orange?> find({required FruitsId id}) async {
    return store.where((s) => s.id == id).firstOrNull;
  }

  @override
  Future<List<Orange>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  @override
  Future<void> save({required Orange orange}) async {
    if (await find(id: orange.id) == null) {
      store = [...store, orange];
    } else {
      final deleted = store.where((s) => s.id != orange.id).toList();
      store = [...deleted, orange];
    }
  }

  @override
  Future<void> delete({required FruitsId id}) async {
    store = store.where((s) => s.id != id).toList();
  }
}

class OrangeRepositoryException implements Exception {
  const OrangeRepositoryException(String message)
      : message = "[OrangeRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
