// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomClass _$CustomClassFromJson(Map<String, dynamic> json) {
  return _CustomClass.fromJson(json);
}

/// @nodoc
mixin _$CustomClass {
  @KeyArgument()
  String get keyValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomClassCopyWith<CustomClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomClassCopyWith<$Res> {
  factory $CustomClassCopyWith(
          CustomClass value, $Res Function(CustomClass) then) =
      _$CustomClassCopyWithImpl<$Res, CustomClass>;
  @useResult
  $Res call({@KeyArgument() String keyValue});
}

/// @nodoc
class _$CustomClassCopyWithImpl<$Res, $Val extends CustomClass>
    implements $CustomClassCopyWith<$Res> {
  _$CustomClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyValue = null,
  }) {
    return _then(_value.copyWith(
      keyValue: null == keyValue
          ? _value.keyValue
          : keyValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomClassImplCopyWith<$Res>
    implements $CustomClassCopyWith<$Res> {
  factory _$$CustomClassImplCopyWith(
          _$CustomClassImpl value, $Res Function(_$CustomClassImpl) then) =
      __$$CustomClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@KeyArgument() String keyValue});
}

/// @nodoc
class __$$CustomClassImplCopyWithImpl<$Res>
    extends _$CustomClassCopyWithImpl<$Res, _$CustomClassImpl>
    implements _$$CustomClassImplCopyWith<$Res> {
  __$$CustomClassImplCopyWithImpl(
      _$CustomClassImpl _value, $Res Function(_$CustomClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyValue = null,
  }) {
    return _then(_$CustomClassImpl(
      keyValue: null == keyValue
          ? _value.keyValue
          : keyValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomClassImpl extends _CustomClass {
  const _$CustomClassImpl({@KeyArgument() required this.keyValue}) : super._();

  factory _$CustomClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomClassImplFromJson(json);

  @override
  @KeyArgument()
  final String keyValue;

  @override
  String toString() {
    return 'CustomClass(keyValue: $keyValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomClassImpl &&
            (identical(other.keyValue, keyValue) ||
                other.keyValue == keyValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, keyValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomClassImplCopyWith<_$CustomClassImpl> get copyWith =>
      __$$CustomClassImplCopyWithImpl<_$CustomClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomClassImplToJson(
      this,
    );
  }
}

abstract class _CustomClass extends CustomClass {
  const factory _CustomClass({@KeyArgument() required final String keyValue}) =
      _$CustomClassImpl;
  const _CustomClass._() : super._();

  factory _CustomClass.fromJson(Map<String, dynamic> json) =
      _$CustomClassImpl.fromJson;

  @override
  @KeyArgument()
  String get keyValue;
  @override
  @JsonKey(ignore: true)
  _$$CustomClassImplCopyWith<_$CustomClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
