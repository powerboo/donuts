import 'package:donuts_annotation/donuts_annotation.dart';

// part 'json_serializable_class.g.dart';

@AggregateRoot(
  jsonConverter: AbstractClassJsonConverter(),
)
class JsonSerializableClass {
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

  /*
  factory JsonSerializableClass.fromJson(Map<String, Object?> json) =>
      _$JsonSerializableClassFromJson(json);

  Map<String, Object?> toJson() => _$JsonSerializableClassToJson(this);
  // */

  @override
  String toString() {
    return value;
  }
}

class AbstractClassJsonConverter
    implements AggregateRootJsonConverter<JsonSerializableClass> {
  const AbstractClassJsonConverter();

  @override
  JsonSerializableClass fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(JsonSerializableClass object) {
    throw UnimplementedError();
  }
}
