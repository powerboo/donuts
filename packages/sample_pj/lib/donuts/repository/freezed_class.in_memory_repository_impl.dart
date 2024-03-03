// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InMemoryRepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/freezed_class.dart';
import 'package:sample_pj/donuts/repository/freezed_class.abstract_interface_repository.dart';

class InMemoryFreezedClassRepositoryImpl implements FreezedClassRepository {
  List<FreezedClass> store = [];

  @override
  Future<FreezedClass?> find({required String key}) async {
    return store.where((s) => s.key == key).firstOrNull;
  }

  @override
  Future<List<FreezedClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  @override
  Future<void> save({required FreezedClass freezedClass}) async {
    if (await find(key: freezedClass.key) == null) {
      store = [...store, freezedClass];
    } else {
      final deleted = store.where((s) => s.key != freezedClass.key).toList();
      store = [...deleted, freezedClass];
    }
  }

  @override
  Future<void> delete({required String key}) async {
    store = store.where((s) => s.key != key).toList();
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
