import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot(
  jsonConverter: CommonClassJsonConverter(),
)
class CommonClass {
  final CommonClassId commonClassId;
  final String name;
  const CommonClass(
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

  String toString() {
    return value;
  }
}

class CommonClassIdFactory implements KeyFactory<CommonClassId> {
  const CommonClassIdFactory();
  @override
  CommonClassId create() {
    // TODO: implement create
    throw UnimplementedError();
  }
}

class CommonClassJsonConverter
    implements AggregateRootJsonConverter<CommonClass> {
  const CommonClassJsonConverter();

  @override
  CommonClass fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(CommonClass object) {
    throw UnimplementedError();
  }
}
