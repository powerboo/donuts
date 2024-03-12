// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceRepositoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

abstract interface class AppleRepository {
  Future<Apple?> find({required FruitsId id});
  Future<List<Apple>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save({required Apple apple});
  Future<void> delete({required FruitsId id});
}
