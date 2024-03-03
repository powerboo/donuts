// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApplicationServiceGenerator
// **************************************************************************

import 'package:donuts_annotation/donuts_error.dart';
import 'package:sample_pj/sample_aggregate_root.dart';

abstract interface class SampleAggregateRootApplicationService {
  Future<(SampleAggregateRoot?, DonutsError?)> create({required String value});
  Future<(SampleAggregateRoot?, DonutsError?)> find({required ObjectId key});
  Future<(void, DonutsError?)> save(
      {required SampleAggregateRoot sampleAggregateRoot});
  Future<(void, DonutsError?)> delete({required ObjectId key});
  Future<(List<SampleAggregateRoot>?, DonutsError?)> all({
    int cursor = 0,
    int length = 100,
  });

  /// method 1
  Future<(SampleAggregateRoot?, DonutsError?)> method1({required ObjectId key});
}
