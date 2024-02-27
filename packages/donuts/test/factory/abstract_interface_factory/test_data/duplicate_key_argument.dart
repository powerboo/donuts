import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldThrow(
  "[DuplicateKeyArgument] KeyArgument annotation is present multiple times. Please ensure only one is used.",
)
@AggregateRoot()
class DuplicateKeyArgument {
  DuplicateKeyArgument({
    @KeyArgument() required String key1,
    @KeyArgument() required String key2,
  });
}
