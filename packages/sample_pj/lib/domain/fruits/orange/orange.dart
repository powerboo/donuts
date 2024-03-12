import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_pj/domain/fruits/common/converter/fruits_id_converter.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

part 'orange.freezed.dart';
part 'orange.g.dart';

@AggregateRoot()
@freezed
class Orange with _$Orange {
  const Orange._();
  const factory Orange({
    @KeyArgument(
      keyFactory: FruitsIdConverter(),
    )
    required FruitsId id,
    required String name,
  }) = _Orange;
  factory Orange.fromJson(Map<String, Object?> json) => _$OrangeFromJson(json);
}

class OrangeException implements Exception {
  late final String message;
  OrangeException(final String message) {
    this.message = "[OrangeException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
