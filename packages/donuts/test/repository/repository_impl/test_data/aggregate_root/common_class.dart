import 'package:donuts_annotation/donuts_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

@ShouldGenerate('''
import 'package:__test__/donuts/repository/common_class_repository.dart';
import 'package:__test__/aggregate_root/common_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommonClassRepositoryImpl implements CommonClassRepository {
  Future<CommonClass?> find({required String key}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/common-class/\${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw CommonClassException("network error");
    }

    return CommonClass.fromJson(response.body);
  }

  Future<List<CommonClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/common-class?cursor=\${cursor}&length=\${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw CommonClassException("network error");
    }

    final List<CommonClass> data = [];
    for (r in response.body) {
      data.add(CommonClass.fromJson(r));
    }
    return data;
  }

  Future<void> save({required CommonClass commonClass}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/common-class",
      ),
      body: jsonEncode(commonClass.toJson()),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw CommonClassException("network error");
    }
  }

  Future<void> delete({required String key}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/common-class/\${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw CommonClassException("network error");
    }
  }
}

class CommonClassException implements Exception {
  CommonClassException(this.message)
      : this.message = "[CommonClassException]\$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}''')

/*
 */
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
