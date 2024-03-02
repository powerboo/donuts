import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_serializable_class.g.dart';

@AggregateRoot()
@JsonSerializable()
class JsonSerializableClass {
  @JsonKey(name: 'json_serializable_class')
  final String value;

  late final String? nullableString;
  late final String key;

  JsonSerializableClass(
    this.value,
    String? nullableString, {
    @KeyArgument() required String key,
    bool? isOk = false,
  }) {
    if (value.isEmpty) {
      throw Exception("JsonSerializableClass does not empty.");
    }
    this.key = key;
    this.nullableString = nullableString;
  }

  factory JsonSerializableClass.fromJson(Map<String, Object?> json) =>
      _$JsonSerializableClassFromJson(json);

  Map<String, Object?> toJson() => _$JsonSerializableClassToJson(this);

  @override
  String toString() {
    return value;
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is JsonSerializableClass && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
