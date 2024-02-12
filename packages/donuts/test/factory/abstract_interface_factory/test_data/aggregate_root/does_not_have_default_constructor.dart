import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldThrow(
  "[DoesNotHaveDefaultConstructor] does not have default constructor.",
)
@AggregateRoot()
class DoesNotHaveDefaultConstructor {
  DoesNotHaveDefaultConstructor.create();
}
