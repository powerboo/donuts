import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot()
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
}

class CommonClassIdFactory implements KeyFactory<CommonClassId> {
  const CommonClassIdFactory();
  @override
  CommonClassId create() {
    // TODO: implement create
    throw UnimplementedError();
  }
}
