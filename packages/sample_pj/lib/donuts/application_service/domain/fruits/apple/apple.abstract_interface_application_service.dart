// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApplicationServiceGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';
import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';

abstract interface class AppleApplicationService {
  Future<(Apple?, DonutsError?)> create({required String apple});
  Future<(Apple?, DonutsError?)> find({required FruitsId id});
  Future<(void, DonutsError?)> save({required Apple apple});
  Future<(void, DonutsError?)> delete({required FruitsId id});
  Future<(List<Apple>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  });
}
