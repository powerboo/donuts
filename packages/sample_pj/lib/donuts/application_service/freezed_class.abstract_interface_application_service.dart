// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApplicationServiceGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/freezed_class.dart';

abstract interface class FreezedClassApplicationService {
  Future<(FreezedClass?, DonutsError?)> create(
    int intValue,
    int? nullableInt, {
    required String freezedClass,
    String? nullableString,
  });
  Future<(FreezedClass?, DonutsError?)> find({required String key});
  Future<(void, DonutsError?)> save({required FreezedClass freezedClass});
  Future<(void, DonutsError?)> delete({required String key});
  Future<(List<FreezedClass>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  });
}
