// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_aggregate_root.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleAggregateRootImpl _$$SampleAggregateRootImplFromJson(
        Map<String, dynamic> json) =>
    _$SampleAggregateRootImpl(
      key: ObjectId.fromJson(json['key'] as Map<String, dynamic>),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$SampleAggregateRootImplToJson(
        _$SampleAggregateRootImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

_$ObjectIdImpl _$$ObjectIdImplFromJson(Map<String, dynamic> json) =>
    _$ObjectIdImpl(
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ObjectIdImplToJson(_$ObjectIdImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
