// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApplicationServiceGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/orange/orange.dart';

abstract interface class OrangeApplicationService {
  Future<(Orange?, DonutsError?)> create({required String name});
  Future<(Orange?, DonutsError?)> find({required FruitsId id});
  Future<(void, DonutsError?)> save({required Orange orange});
  Future<(void, DonutsError?)> delete({required FruitsId id});
  Future<(List<Orange>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  });
}
