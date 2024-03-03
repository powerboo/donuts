import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot(
  jsonConverter: DuplicateClass1JsonConverter(),
)
class DuplicateClass1 {
  final CommonClassId commonClassId;
  final String name;
  const DuplicateClass1(
    String value,
    String? nullableValue, {
    @KeyArgument(
      keyFactory: CommonClassIdFactory(),
    )
    required this.commonClassId,
    required this.name,
  });
}

class CommonClassId {
  final String value;
  CommonClassId(this.value);
}

@AggregateRoot(
  jsonConverter: DuplicateClass1JsonConverter(),
)
class DuplicateClass2 {
  final CommonClassId commonClassId;
  final String name;
  const DuplicateClass2(
    String value,
    String? nullableValue, {
    @KeyArgument(
      keyFactory: CommonClassIdFactory(),
    )
    required this.commonClassId,
    required this.name,
  });
}

class CommonClassIdFactory implements KeyFactory<CommonClassId> {
  const CommonClassIdFactory();
  @override
  CommonClassId create() {
    // TODO: implement create
    throw UnimplementedError();
  }
}

class DuplicateClass1JsonConverter
    implements AggregateRootJsonConverter<DuplicateClass1> {
  const DuplicateClass1JsonConverter();

  @override
  DuplicateClass1 fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(DuplicateClass1 object) {
    throw UnimplementedError();
  }
}
