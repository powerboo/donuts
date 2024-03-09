// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InMemoryRepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/abstract_class.dart';
import 'package:sample_pj/donuts/repository/domain/abstract_class.abstract_interface_repository.dart';

class InMemoryAbstractClassRepositoryImpl implements AbstractClassRepository {
  List<AbstractClass> store = [];

  @override
  Future<AbstractClass?> find({required String key}) async {
    return store.where((s) => s.key == key).firstOrNull;
  }

  @override
  Future<List<AbstractClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  @override
  Future<void> save({required AbstractClass abstractClass}) async {
    if (await find(key: abstractClass.key) == null) {
      store = [...store, abstractClass];
    } else {
      final deleted = store.where((s) => s.key != abstractClass.key).toList();
      store = [...deleted, abstractClass];
    }
  }

  @override
  Future<void> delete({required String key}) async {
    store = store.where((s) => s.key != key).toList();
  }
}

class AbstractClassRepositoryException implements Exception {
  const AbstractClassRepositoryException(String message)
      : message = "[AbstractClassRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
