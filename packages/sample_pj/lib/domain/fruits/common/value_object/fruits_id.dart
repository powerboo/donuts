import 'package:freezed_annotation/freezed_annotation.dart';

part 'fruits_id.g.dart';

@JsonSerializable()
class FruitsId {
  @JsonKey(name: 'fruits_id')
  final String value;

  FruitsId(this.value) {
    if (value.isEmpty) {
      throw FruitsIdException("FruitsId does not empty.");
    }
  }

  factory FruitsId.fromJson(Map<String, Object?> json) =>
      _$FruitsIdFromJson(json);

  Map<String, Object?> toJson() => _$FruitsIdToJson(this);

  @override
  String toString() {
    return value;
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is FruitsId && other.value == value);

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}

class FruitsIdException implements Exception {
  late final String message;
  FruitsIdException(final String message) {
    this.message = "[FruitsIdException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
