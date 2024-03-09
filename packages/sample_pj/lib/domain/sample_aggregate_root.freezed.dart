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
  @KeyArgument(keyFactory: ObjectKeyFactory())
  ObjectId get key => throw _privateConstructorUsedError;
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
      {@KeyArgument(keyFactory: ObjectKeyFactory()) ObjectId key,
      String value});

  $ObjectIdCopyWith<$Res> get key;
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
              as ObjectId,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObjectIdCopyWith<$Res> get key {
    return $ObjectIdCopyWith<$Res>(_value.key, (value) {
      return _then(_value.copyWith(key: value) as $Val);
    });
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
      {@KeyArgument(keyFactory: ObjectKeyFactory()) ObjectId key,
      String value});

  @override
  $ObjectIdCopyWith<$Res> get key;
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
              as ObjectId,
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
      {@KeyArgument(keyFactory: ObjectKeyFactory()) required this.key,
      required this.value})
      : super._();

  factory _$SampleAggregateRootImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleAggregateRootImplFromJson(json);

  @override
  @KeyArgument(keyFactory: ObjectKeyFactory())
  final ObjectId key;
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
      {@KeyArgument(keyFactory: ObjectKeyFactory()) required final ObjectId key,
      required final String value}) = _$SampleAggregateRootImpl;
  _SampleAggregateRoot._() : super._();

  factory _SampleAggregateRoot.fromJson(Map<String, dynamic> json) =
      _$SampleAggregateRootImpl.fromJson;

  @override
  @KeyArgument(keyFactory: ObjectKeyFactory())
  ObjectId get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$SampleAggregateRootImplCopyWith<_$SampleAggregateRootImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObjectId _$ObjectIdFromJson(Map<String, dynamic> json) {
  return _ObjectId.fromJson(json);
}

/// @nodoc
mixin _$ObjectId {
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObjectIdCopyWith<ObjectId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectIdCopyWith<$Res> {
  factory $ObjectIdCopyWith(ObjectId value, $Res Function(ObjectId) then) =
      _$ObjectIdCopyWithImpl<$Res, ObjectId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ObjectIdCopyWithImpl<$Res, $Val extends ObjectId>
    implements $ObjectIdCopyWith<$Res> {
  _$ObjectIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObjectIdImplCopyWith<$Res>
    implements $ObjectIdCopyWith<$Res> {
  factory _$$ObjectIdImplCopyWith(
          _$ObjectIdImpl value, $Res Function(_$ObjectIdImpl) then) =
      __$$ObjectIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ObjectIdImplCopyWithImpl<$Res>
    extends _$ObjectIdCopyWithImpl<$Res, _$ObjectIdImpl>
    implements _$$ObjectIdImplCopyWith<$Res> {
  __$$ObjectIdImplCopyWithImpl(
      _$ObjectIdImpl _value, $Res Function(_$ObjectIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ObjectIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObjectIdImpl extends _ObjectId {
  _$ObjectIdImpl({required this.value}) : super._();

  factory _$ObjectIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObjectIdImplFromJson(json);

  @override
  final String value;

  @override
  String toString() {
    return 'ObjectId(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectIdImplCopyWith<_$ObjectIdImpl> get copyWith =>
      __$$ObjectIdImplCopyWithImpl<_$ObjectIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObjectIdImplToJson(
      this,
    );
  }
}

abstract class _ObjectId extends ObjectId {
  factory _ObjectId({required final String value}) = _$ObjectIdImpl;
  _ObjectId._() : super._();

  factory _ObjectId.fromJson(Map<String, dynamic> json) =
      _$ObjectIdImpl.fromJson;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$ObjectIdImplCopyWith<_$ObjectIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
