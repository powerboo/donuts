// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/abstract_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/abstract_class.dart';
import 'package:sample_pj/donuts/repository/api/domain/abstract_class.abstract_interface_api.dart';

class AbstractClassRepositoryImpl implements AbstractClassRepository {
  AbstractClassRepositoryImpl({required this.api});

  final AbstractClassApi api;

  @override
  Future<AbstractClass?> find({required String key}) async {
    return api.find(key: key);
  }

  @override
  Future<List<AbstractClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return api.all(
      cursor: cursor,
      length: length,
    );
  }

  @override
  Future<void> save({required AbstractClass abstractClass}) async {
    api.save(abstractClass: abstractClass);
  }

  @override
  Future<void> delete({required String key}) async {
    api.delete(key: key);
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
