import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldThrow(
  "[AnnotatedArgumentDoesNotExists] annotated field does not exists.",
)
@AggregateRoot()
class AnnotatedArgumentDoesNotExists {
  AnnotatedArgumentDoesNotExists({
    required String key1,
    required String key2,
  });
}
