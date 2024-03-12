// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceRepositoryGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

abstract interface class OrangeRepository {
  Future<Orange?> find({required FruitsId id});
  Future<List<Orange>> all({
    int cursor = 0,
    int length = 100,
  });
  Future<void> save({required Orange orange});
  Future<void> delete({required FruitsId id});
}
