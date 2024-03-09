// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FreezedClass _$FreezedClassFromJson(Map<String, dynamic> json) {
  return _FreezedClass.fromJson(json);
}

/// @nodoc
mixin _$FreezedClass {
  int get intValue => throw _privateConstructorUsedError;
  int? get nullableInt => throw _privateConstructorUsedError;
  @KeyArgument()
  String get key => throw _privateConstructorUsedError;
  String get freezedClass => throw _privateConstructorUsedError;
  String? get nullableString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezedClassCopyWith<FreezedClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedClassCopyWith<$Res> {
  factory $FreezedClassCopyWith(
          FreezedClass value, $Res Function(FreezedClass) then) =
      _$FreezedClassCopyWithImpl<$Res, FreezedClass>;
  @useResult
  $Res call(
      {int intValue,
      int? nullableInt,
      @KeyArgument() String key,
      String freezedClass,
      String? nullableString});
}

/// @nodoc
class _$FreezedClassCopyWithImpl<$Res, $Val extends FreezedClass>
    implements $FreezedClassCopyWith<$Res> {
  _$FreezedClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intValue = null,
    Object? nullableInt = freezed,
    Object? key = null,
    Object? freezedClass = null,
    Object? nullableString = freezed,
  }) {
    return _then(_value.copyWith(
      intValue: null == intValue
          ? _value.intValue
          : intValue // ignore: cast_nullable_to_non_nullable
              as int,
      nullableInt: freezed == nullableInt
          ? _value.nullableInt
          : nullableInt // ignore: cast_nullable_to_non_nullable
              as int?,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      freezedClass: null == freezedClass
          ? _value.freezedClass
          : freezedClass // ignore: cast_nullable_to_non_nullable
              as String,
      nullableString: freezed == nullableString
          ? _value.nullableString
          : nullableString // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreezedClassImplCopyWith<$Res>
    implements $FreezedClassCopyWith<$Res> {
  factory _$$FreezedClassImplCopyWith(
          _$FreezedClassImpl value, $Res Function(_$FreezedClassImpl) then) =
      __$$FreezedClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int intValue,
      int? nullableInt,
      @KeyArgument() String key,
      String freezedClass,
      String? nullableString});
}

/// @nodoc
class __$$FreezedClassImplCopyWithImpl<$Res>
    extends _$FreezedClassCopyWithImpl<$Res, _$FreezedClassImpl>
    implements _$$FreezedClassImplCopyWith<$Res> {
  __$$FreezedClassImplCopyWithImpl(
      _$FreezedClassImpl _value, $Res Function(_$FreezedClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intValue = null,
    Object? nullableInt = freezed,
    Object? key = null,
    Object? freezedClass = null,
    Object? nullableString = freezed,
  }) {
    return _then(_$FreezedClassImpl(
      null == intValue
          ? _value.intValue
          : intValue // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == nullableInt
          ? _value.nullableInt
          : nullableInt // ignore: cast_nullable_to_non_nullable
              as int?,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      freezedClass: null == freezedClass
          ? _value.freezedClass
          : freezedClass // ignore: cast_nullable_to_non_nullable
              as String,
      nullableString: freezed == nullableString
          ? _value.nullableString
          : nullableString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreezedClassImpl extends _FreezedClass {
  const _$FreezedClassImpl(this.intValue, this.nullableInt,
      {@KeyArgument() required this.key,
      required this.freezedClass,
      this.nullableString})
      : super._();

  factory _$FreezedClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezedClassImplFromJson(json);

  @override
  final int intValue;
  @override
  final int? nullableInt;
  @override
  @KeyArgument()
  final String key;
  @override
  final String freezedClass;
  @override
  final String? nullableString;

  @override
  String toString() {
    return 'FreezedClass(intValue: $intValue, nullableInt: $nullableInt, key: $key, freezedClass: $freezedClass, nullableString: $nullableString)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezedClassImpl &&
            (identical(other.intValue, intValue) ||
                other.intValue == intValue) &&
            (identical(other.nullableInt, nullableInt) ||
                other.nullableInt == nullableInt) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.freezedClass, freezedClass) ||
                other.freezedClass == freezedClass) &&
            (identical(other.nullableString, nullableString) ||
                other.nullableString == nullableString));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, intValue, nullableInt, key, freezedClass, nullableString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezedClassImplCopyWith<_$FreezedClassImpl> get copyWith =>
      __$$FreezedClassImplCopyWithImpl<_$FreezedClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezedClassImplToJson(
      this,
    );
  }
}

abstract class _FreezedClass extends FreezedClass {
  const factory _FreezedClass(final int intValue, final int? nullableInt,
      {@KeyArgument() required final String key,
      required final String freezedClass,
      final String? nullableString}) = _$FreezedClassImpl;
  const _FreezedClass._() : super._();

  factory _FreezedClass.fromJson(Map<String, dynamic> json) =
      _$FreezedClassImpl.fromJson;

  @override
  int get intValue;
  @override
  int? get nullableInt;
  @override
  @KeyArgument()
  String get key;
  @override
  String get freezedClass;
  @override
  String? get nullableString;
  @override
  @JsonKey(ignore: true)
  _$$FreezedClassImplCopyWith<_$FreezedClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
