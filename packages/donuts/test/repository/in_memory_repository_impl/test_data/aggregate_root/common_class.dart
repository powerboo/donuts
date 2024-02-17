import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/donuts/repository/common_class_repository.dart';
import 'package:__test__/aggregate_root/common_class.dart';

class InMemoryCommonClassRepositoryImpl implements CommonClassRepository {
  final List<CommonClass> store = [];

  Future<CommonClass?> find({required String key}) async {
    return store.where((s) => s.key == key).firstOrNull;
  }

  Future<List<CommonClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    return store.skip(cursor).take(length).toList();
  }

  Future<void> save({required CommonClass commonClass}) async {
    if (await find(key: commonClass.key) == null) {
      store = [...store, commonClass];
    } else {
      final deleted = store.where((s) => s.key != commonClass.key).toList();
      store = [...deleted, commonClass];
    }
  }

  Future<void> delete({required String key}) async {
    store = store.where((s) => s.key != commonClass.key).toList();
  }
}

class CommonClassRepositoryException implements Exception {
  CommonClassRepositoryException(this.message)
      : this.message = "[CommonClassRepositoryException] \$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}''')
@AggregateRoot()
class CommonClass {
  final String name;
  const CommonClass(
    String value,
    String? nullableValue, {
    @KeyArgument() required String key,
    required this.name,
  });
}
