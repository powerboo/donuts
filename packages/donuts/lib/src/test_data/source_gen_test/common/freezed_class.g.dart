// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezedClassImpl _$$FreezedClassImplFromJson(Map<String, dynamic> json) =>
    _$FreezedClassImpl(
      (json['intValue'] as num).toInt(),
      (json['nullableInt'] as num?)?.toInt(),
      key: json['key'] as String,
      freezedClass: json['freezedClass'] as String,
      nullableString: json['nullableString'] as String?,
    );

Map<String, dynamic> _$$FreezedClassImplToJson(_$FreezedClassImpl instance) =>
    <String, dynamic>{
      'intValue': instance.intValue,
      'nullableInt': instance.nullableInt,
      'key': instance.key,
      'freezedClass': instance.freezedClass,
      'nullableString': instance.nullableString,
    };
