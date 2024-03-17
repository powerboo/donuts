// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AbstractInterfaceApiGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.abstract_interface_repository.dart';
import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:method_to_swagger_yaml_annotation/method_to_swagger_yaml_annotation.dart';

@ConvertTargetClass(
  title: "title",
  version: "0.0.1",
)
abstract interface class SampleAggregateRootApi
    implements SampleAggregateRootRepository {
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "sample-aggregate-root/:key",
  )
  @override
  Future<SampleAggregateRoot?> find({required ObjectId key});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.get,
    pathName: "sample-aggregate-root",
  )
  @override
  Future<List<SampleAggregateRoot>> all({
    int cursor = 0,
    int length = 100,
  });
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.post,
    pathName: "sample-aggregate-root",
  )
  @override
  Future<void> save({required SampleAggregateRoot sampleAggregateRoot});
  @ConvertTargetMethod(
    httpMethod: HttpMethodDiv.delete,
    pathName: "sample-aggregate-root/:key",
  )
  @override
  Future<void> delete({required ObjectId key});
}
