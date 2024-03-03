import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ignore_method_class.freezed.dart';
part 'ignore_method_class.g.dart';

@AggregateRoot()
@freezed
class IgnoreMethodClass with _$IgnoreMethodClass {
  const IgnoreMethodClass._();
  const factory IgnoreMethodClass({
    @KeyArgument() required String keyValue,
  }) = _IgnoreMethodClass;
  factory IgnoreMethodClass.fromJson(Map<String, Object?> json) =>
      _$IgnoreMethodClassFromJson(json);

  /// method 1
  IgnoreMethodClass method1() {
    return copyWith();
  }

  /// ignore: unused_element
  @IgnoreMethod()
  int method2() {
    return 0;
  }
}

class IgnoreMethodClassException implements Exception {
  late final String message;
  IgnoreMethodClassException(final String message) {
    this.message = "[IgnoreMethodClassException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
