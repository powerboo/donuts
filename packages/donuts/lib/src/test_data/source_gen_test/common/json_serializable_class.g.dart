// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonSerializableClass _$JsonSerializableClassFromJson(
        Map<String, dynamic> json) =>
    JsonSerializableClass(
      json['json_serializable_class'] as String,
      json['nullableString'] as String?,
      key: json['key'] as String,
    );

Map<String, dynamic> _$JsonSerializableClassToJson(
        JsonSerializableClass instance) =>
    <String, dynamic>{
      'json_serializable_class': instance.value,
      'nullableString': instance.nullableString,
      'key': instance.key,
    };
