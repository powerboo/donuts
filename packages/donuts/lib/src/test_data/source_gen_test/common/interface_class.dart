import 'package:donuts/src/test_data/source_gen_test/common/key_field_factory.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot(
  jsonConverter: InterfaceClassJsonConverter(),
)
interface class InterfaceClass {
  String get key {
    return "";
  }

  InterfaceClass({
    @KeyArgument(
      keyFactory: KeyFieldFactory(),
    )
    required String key,
  });
}

class InterfaceClassJsonConverter
    implements AggregateRootJsonConverter<InterfaceClass> {
  const InterfaceClassJsonConverter();

  @override
  InterfaceClass fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(InterfaceClass object) {
    throw UnimplementedError();
  }
}
