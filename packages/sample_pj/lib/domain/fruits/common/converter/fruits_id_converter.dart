import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class FruitsIdConverter implements KeyFactory<FruitsId> {
  const FruitsIdConverter();

  @override
  FruitsId create() {
    // TODO: implement create
    throw UnimplementedError();
  }
}

class FruitsIdConverterException implements Exception {
  late final String message;
  FruitsIdConverterException(final String message) {
    this.message = "[FruitsIdConverterException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
