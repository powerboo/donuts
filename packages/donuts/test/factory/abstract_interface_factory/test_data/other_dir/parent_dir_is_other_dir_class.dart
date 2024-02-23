import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldThrow('[ParentDirIsOtherDirClass] parent directory is not aggregate_root.')
@AggregateRoot()
class ParentDirIsOtherDirClass {
  final String name;
  const ParentDirIsOtherDirClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
}
