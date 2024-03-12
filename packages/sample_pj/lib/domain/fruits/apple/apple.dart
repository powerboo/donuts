import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_pj/domain/fruits/common/converter/fruits_id_converter.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

part 'apple.freezed.dart';
part 'apple.g.dart';

@AggregateRoot()
@freezed
class Apple with _$Apple {
  const Apple._();
  const factory Apple({
    @KeyArgument(
      keyFactory: FruitsIdConverter(),
    )
    required FruitsId id,
    required String apple,
  }) = _Apple;
  factory Apple.fromJson(Map<String, Object?> json) => _$AppleFromJson(json);
}

class AppleException implements Exception {
  late final String message;
  AppleException(final String message) {
    this.message = "[AppleException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
