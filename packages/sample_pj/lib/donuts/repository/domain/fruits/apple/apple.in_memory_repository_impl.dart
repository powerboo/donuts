// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InMemoryRepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class InMemoryAppleRepositoryImpl implements AppleRepository {
  List<Apple> store = [];

  @override
  Future<Apple?> find({required FruitsId id}) async {
    return store.where((s) => s.id == id).firstOrNull;
  }

  @override
  Future<List<Apple>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  @override
  Future<void> save({required Apple apple}) async {
    if (await find(id: apple.id) == null) {
      store = [...store, apple];
    } else {
      final deleted = store.where((s) => s.id != apple.id).toList();
      store = [...deleted, apple];
    }
  }

  @override
  Future<void> delete({required FruitsId id}) async {
    store = store.where((s) => s.id != id).toList();
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
