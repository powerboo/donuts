import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_class.freezed.dart';
part 'custom_class.g.dart';

@AggregateRoot(
  customFactory: true,
  customRepository: true,
  customInMemoryRepository: true,
  customApplicationService: true,
  customListState: true,
  customSingleState: true,
)
@freezed
class CustomClass with _$CustomClass {
  const CustomClass._();
  const factory CustomClass({
    @KeyArgument() required String keyValue,
  }) = _CustomClass;
  factory CustomClass.fromJson(Map<String, Object?> json) =>
      _$CustomClassFromJson(json);

  /// method 1
  CustomClass method1() {
    return copyWith();
  }

  /// ignore: unused_element
  @IgnoreMethod()
  int method2() {
    return 0;
  }
}

class CustomClassException implements Exception {
  late final String message;
  CustomClassException(final String message) {
    this.message = "[CustomClassException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
