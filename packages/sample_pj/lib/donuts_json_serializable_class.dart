import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donuts_json_serializable_class.g.dart';

@AggregateRoot(
  jsonConverter: DonutsJsonSerializableJsonConverter(),
)
@JsonSerializable()
class DonutsJsonSerializableClass {
  final String key;

  final String? nullableString;

  DonutsJsonSerializableClass(
    this.nullableString, {
    @KeyArgument() required this.key,
    bool? isOk = false,
  });

  @override
  String toString() {
    return key;
  }
}

class DonutsJsonSerializableJsonConverter
    implements AggregateRootJsonConverter<DonutsJsonSerializableClass> {
  const DonutsJsonSerializableJsonConverter();

  @override
  DonutsJsonSerializableClass fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(DonutsJsonSerializableClass object) {
    throw UnimplementedError();
  }
}
