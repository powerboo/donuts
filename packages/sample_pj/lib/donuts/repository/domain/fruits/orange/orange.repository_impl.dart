// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/fruits/orange/orange.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/repository/api/domain/fruits/orange/orange.abstract_interface_api.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class OrangeRepositoryImpl implements OrangeRepository {
  OrangeRepositoryImpl({required this.api});

  final OrangeApi api;

  @override
  Future<Orange?> find({required FruitsId id}) async {
    return api.find(id: id);
  }

  @override
  Future<List<Orange>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return api.all(
      cursor: cursor,
      length: length,
    );
  }

  @override
  Future<void> save({required Orange orange}) async {
    api.save(orange: orange);
  }

  @override
  Future<void> delete({required FruitsId id}) async {
    api.delete(id: id);
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
