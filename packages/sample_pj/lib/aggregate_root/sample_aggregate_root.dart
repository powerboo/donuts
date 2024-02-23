import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot()
class SampleAggregateRoot {
  const SampleAggregateRoot({
    @KeyArgument() required String key,
    required String value,
  });
}

class SampleAggregateRootException implements Exception {
  late final String message;
  SampleAggregateRootException(final String message) {
    this.message = "[SampleAggregateRootException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
