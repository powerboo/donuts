// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Apple _$AppleFromJson(Map<String, dynamic> json) {
  return _Apple.fromJson(json);
}

/// @nodoc
mixin _$Apple {
  @KeyArgument(keyFactory: FruitsIdConverter())
  FruitsId get id => throw _privateConstructorUsedError;
  String get apple => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppleCopyWith<Apple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleCopyWith<$Res> {
  factory $AppleCopyWith(Apple value, $Res Function(Apple) then) =
      _$AppleCopyWithImpl<$Res, Apple>;
  @useResult
  $Res call(
      {@KeyArgument(keyFactory: FruitsIdConverter()) FruitsId id,
      String apple});
}

/// @nodoc
class _$AppleCopyWithImpl<$Res, $Val extends Apple>
    implements $AppleCopyWith<$Res> {
  _$AppleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? apple = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as FruitsId,
      apple: null == apple
          ? _value.apple
          : apple // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppleImplCopyWith<$Res> implements $AppleCopyWith<$Res> {
  factory _$$AppleImplCopyWith(
          _$AppleImpl value, $Res Function(_$AppleImpl) then) =
      __$$AppleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@KeyArgument(keyFactory: FruitsIdConverter()) FruitsId id,
      String apple});
}

/// @nodoc
class __$$AppleImplCopyWithImpl<$Res>
    extends _$AppleCopyWithImpl<$Res, _$AppleImpl>
    implements _$$AppleImplCopyWith<$Res> {
  __$$AppleImplCopyWithImpl(
      _$AppleImpl _value, $Res Function(_$AppleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? apple = null,
  }) {
    return _then(_$AppleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as FruitsId,
      apple: null == apple
          ? _value.apple
          : apple // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppleImpl extends _Apple {
  const _$AppleImpl(
      {@KeyArgument(keyFactory: FruitsIdConverter()) required this.id,
      required this.apple})
      : super._();

  factory _$AppleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppleImplFromJson(json);

  @override
  @KeyArgument(keyFactory: FruitsIdConverter())
  final FruitsId id;
  @override
  final String apple;

  @override
  String toString() {
    return 'Apple(id: $id, apple: $apple)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.apple, apple) || other.apple == apple));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, apple);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleImplCopyWith<_$AppleImpl> get copyWith =>
      __$$AppleImplCopyWithImpl<_$AppleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppleImplToJson(
      this,
    );
  }
}

abstract class _Apple extends Apple {
  const factory _Apple(
      {@KeyArgument(keyFactory: FruitsIdConverter()) required final FruitsId id,
      required final String apple}) = _$AppleImpl;
  const _Apple._() : super._();

  factory _Apple.fromJson(Map<String, dynamic> json) = _$AppleImpl.fromJson;

  @override
  @KeyArgument(keyFactory: FruitsIdConverter())
  FruitsId get id;
  @override
  String get apple;
  @override
  @JsonKey(ignore: true)
  _$$AppleImplCopyWith<_$AppleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
