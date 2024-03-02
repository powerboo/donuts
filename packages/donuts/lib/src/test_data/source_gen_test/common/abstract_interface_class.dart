import 'package:donuts/src/test_data/source_gen_test/common/key_field_factory.dart';
import 'package:donuts_annotation/donuts_annotation.dart';

@AggregateRoot()
abstract interface class AbstractInterfaceClass {
  AbstractInterfaceClass(
    @KeyArgument(
      keyFactory: KeyFieldFactory(),
    )
    String key,
  );
}
