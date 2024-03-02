import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_aggregate_root.freezed.dart';
part 'sample_aggregate_root.g.dart';

@AggregateRoot()
@freezed
class SampleAggregateRoot with _$SampleAggregateRoot {
  const SampleAggregateRoot._();
  factory SampleAggregateRoot({
    @KeyArgument(
      keyArgumentDiv: KeyArgumentDiv.object,
      keyFactory: ObjectKeyFactory(),
    )
    required String key,
    required String value,
  }) = _SampleAggregateRoot;

  factory SampleAggregateRoot.fromJson(Map<String, dynamic> json) =>
      _SampleAggregateRoot.fromJson(json);

  /// method 1
  SampleAggregateRoot method1() {
    return copyWith();
  }
}

class ObjectKeyFactory implements KeyFactory<ObjectId> {
  const ObjectKeyFactory();
  @override
  ObjectId create() {
    // TODO: implement create
    throw UnimplementedError();
  }
}

class ObjectId {
  final String value;
  ObjectId(this.value);
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
