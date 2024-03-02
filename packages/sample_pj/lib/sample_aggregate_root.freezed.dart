// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_aggregate_root.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SampleAggregateRoot _$SampleAggregateRootFromJson(Map<String, dynamic> json) {
  return _SampleAggregateRoot.fromJson(json);
}

/// @nodoc
mixin _$SampleAggregateRoot {
  @KeyArgument(
      keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SampleAggregateRootCopyWith<SampleAggregateRoot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleAggregateRootCopyWith<$Res> {
  factory $SampleAggregateRootCopyWith(
          SampleAggregateRoot value, $Res Function(SampleAggregateRoot) then) =
      _$SampleAggregateRootCopyWithImpl<$Res, SampleAggregateRoot>;
  @useResult
  $Res call(
      {@KeyArgument(
          keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
      String key,
      String value});
}

/// @nodoc
class _$SampleAggregateRootCopyWithImpl<$Res, $Val extends SampleAggregateRoot>
    implements $SampleAggregateRootCopyWith<$Res> {
  _$SampleAggregateRootCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SampleAggregateRootImplCopyWith<$Res>
    implements $SampleAggregateRootCopyWith<$Res> {
  factory _$$SampleAggregateRootImplCopyWith(_$SampleAggregateRootImpl value,
          $Res Function(_$SampleAggregateRootImpl) then) =
      __$$SampleAggregateRootImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@KeyArgument(
          keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
      String key,
      String value});
}

/// @nodoc
class __$$SampleAggregateRootImplCopyWithImpl<$Res>
    extends _$SampleAggregateRootCopyWithImpl<$Res, _$SampleAggregateRootImpl>
    implements _$$SampleAggregateRootImplCopyWith<$Res> {
  __$$SampleAggregateRootImplCopyWithImpl(_$SampleAggregateRootImpl _value,
      $Res Function(_$SampleAggregateRootImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$SampleAggregateRootImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleAggregateRootImpl extends _SampleAggregateRoot {
  _$SampleAggregateRootImpl(
      {@KeyArgument(
          keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
      required this.key,
      required this.value})
      : super._();

  factory _$SampleAggregateRootImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleAggregateRootImplFromJson(json);

  @override
  @KeyArgument(
      keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
  final String key;
  @override
  final String value;

  @override
  String toString() {
    return 'SampleAggregateRoot(key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleAggregateRootImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleAggregateRootImplCopyWith<_$SampleAggregateRootImpl> get copyWith =>
      __$$SampleAggregateRootImplCopyWithImpl<_$SampleAggregateRootImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleAggregateRootImplToJson(
      this,
    );
  }
}

abstract class _SampleAggregateRoot extends SampleAggregateRoot {
  factory _SampleAggregateRoot(
      {@KeyArgument(
          keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
      required final String key,
      required final String value}) = _$SampleAggregateRootImpl;
  _SampleAggregateRoot._() : super._();

  factory _SampleAggregateRoot.fromJson(Map<String, dynamic> json) =
      _$SampleAggregateRootImpl.fromJson;

  @override
  @KeyArgument(
      keyArgumentDiv: KeyArgumentDiv.object, keyFactory: ObjectKeyFactory())
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$SampleAggregateRootImplCopyWith<_$SampleAggregateRootImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
