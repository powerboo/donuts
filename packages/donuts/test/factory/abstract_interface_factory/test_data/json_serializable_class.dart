import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

part 'json_serializable_class.g.dart';

@ShouldGenerate('''
import 'package:__test__/json_serializable_class.dart';

abstract interface class JsonSerializableClassFactory {
  JsonSerializableClass create(
    String value,
    String? nullableString, {
    bool? isOk,
  });
  JsonSerializableClass restore(
    String value,
    String? nullableString, {
    required int key,
    bool? isOk,
  });
}''')
@AggregateRoot()
@JsonSerializable()
class JsonSerializableClass {
  @JsonKey(name: 'json_serializable_class')
  final String value;

  late final String? nullableString;
  late final int key;

  JsonSerializableClass(
    this.value,
    String? nullableString, {
    @KeyArgument() required int key,
    bool? isOk = false,
  }) {
    if (value.isEmpty) {
      throw JsonSerializableClassException("JsonSerializableClass does not empty.");
    }
    this.key = key;
    this.nullableString = nullableString;
  }

  factory JsonSerializableClass.fromJson(Map<String, Object?> json) => _$JsonSerializableClassFromJson(json);

  Map<String, Object?> toJson() => _$JsonSerializableClassToJson(this);

  @override
  String toString() {
    return value;
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is JsonSerializableClass && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}

class JsonSerializableClassException implements Exception {
  late final String message;
  JsonSerializableClassException(final String message) {
    this.message = "[JsonSerializableClassException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
