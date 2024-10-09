// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ignore_method_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IgnoreMethodClass _$IgnoreMethodClassFromJson(Map<String, dynamic> json) {
  return _IgnoreMethodClass.fromJson(json);
}

/// @nodoc
mixin _$IgnoreMethodClass {
  @KeyArgument()
  String get keyValue => throw _privateConstructorUsedError;

  /// Serializes this IgnoreMethodClass to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IgnoreMethodClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IgnoreMethodClassCopyWith<IgnoreMethodClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IgnoreMethodClassCopyWith<$Res> {
  factory $IgnoreMethodClassCopyWith(
          IgnoreMethodClass value, $Res Function(IgnoreMethodClass) then) =
      _$IgnoreMethodClassCopyWithImpl<$Res, IgnoreMethodClass>;
  @useResult
  $Res call({@KeyArgument() String keyValue});
}

/// @nodoc
class _$IgnoreMethodClassCopyWithImpl<$Res, $Val extends IgnoreMethodClass>
    implements $IgnoreMethodClassCopyWith<$Res> {
  _$IgnoreMethodClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IgnoreMethodClass
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$IgnoreMethodClassImplCopyWith<$Res>
    implements $IgnoreMethodClassCopyWith<$Res> {
  factory _$$IgnoreMethodClassImplCopyWith(_$IgnoreMethodClassImpl value,
          $Res Function(_$IgnoreMethodClassImpl) then) =
      __$$IgnoreMethodClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@KeyArgument() String keyValue});
}

/// @nodoc
class __$$IgnoreMethodClassImplCopyWithImpl<$Res>
    extends _$IgnoreMethodClassCopyWithImpl<$Res, _$IgnoreMethodClassImpl>
    implements _$$IgnoreMethodClassImplCopyWith<$Res> {
  __$$IgnoreMethodClassImplCopyWithImpl(_$IgnoreMethodClassImpl _value,
      $Res Function(_$IgnoreMethodClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of IgnoreMethodClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyValue = null,
  }) {
    return _then(_$IgnoreMethodClassImpl(
      keyValue: null == keyValue
          ? _value.keyValue
          : keyValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IgnoreMethodClassImpl extends _IgnoreMethodClass {
  const _$IgnoreMethodClassImpl({@KeyArgument() required this.keyValue})
      : super._();

  factory _$IgnoreMethodClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$IgnoreMethodClassImplFromJson(json);

  @override
  @KeyArgument()
  final String keyValue;

  @override
  String toString() {
    return 'IgnoreMethodClass(keyValue: $keyValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IgnoreMethodClassImpl &&
            (identical(other.keyValue, keyValue) ||
                other.keyValue == keyValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyValue);

  /// Create a copy of IgnoreMethodClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IgnoreMethodClassImplCopyWith<_$IgnoreMethodClassImpl> get copyWith =>
      __$$IgnoreMethodClassImplCopyWithImpl<_$IgnoreMethodClassImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IgnoreMethodClassImplToJson(
      this,
    );
  }
}

abstract class _IgnoreMethodClass extends IgnoreMethodClass {
  const factory _IgnoreMethodClass(
          {@KeyArgument() required final String keyValue}) =
      _$IgnoreMethodClassImpl;
  const _IgnoreMethodClass._() : super._();

  factory _IgnoreMethodClass.fromJson(Map<String, dynamic> json) =
      _$IgnoreMethodClassImpl.fromJson;

  @override
  @KeyArgument()
  String get keyValue;

  /// Create a copy of IgnoreMethodClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IgnoreMethodClassImplCopyWith<_$IgnoreMethodClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
