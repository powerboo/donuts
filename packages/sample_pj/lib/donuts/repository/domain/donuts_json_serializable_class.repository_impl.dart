// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/donuts_json_serializable_class.abstract_interface_repository.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonutsJsonSerializableClassRepositoryImpl
    implements DonutsJsonSerializableClassRepository {
  DonutsJsonSerializableJsonConverter converter =
      DonutsJsonSerializableJsonConverter();

  @override
  Future<DonutsJsonSerializableClass?> find({required String key}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/donuts-json-serializable-class/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw DonutsJsonSerializableClassRepositoryException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw DonutsJsonSerializableClassRepositoryException(
          "body is not Map<String, dynamic>");
    }

    return converter.fromJson(body);
  }

  @override
  Future<List<DonutsJsonSerializableClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/donuts-json-serializable-class?cursor=${cursor}&length=${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw DonutsJsonSerializableClassRepositoryException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw DonutsJsonSerializableClassRepositoryException(
          "data is not List<Map<String, dynamic>>");
    }

    final List<DonutsJsonSerializableClass> result = [];
    for (final r in data) {
      result.add(converter.fromJson(r));
    }
    return result;
  }

  @override
  Future<void> save(
      {required DonutsJsonSerializableClass
          donutsJsonSerializableClass}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/donuts-json-serializable-class",
      ),
      body: jsonEncode(converter.toJson(donutsJsonSerializableClass)),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw DonutsJsonSerializableClassRepositoryException("network error");
    }
  }

  @override
  Future<void> delete({required String key}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/donuts-json-serializable-class/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw DonutsJsonSerializableClassRepositoryException("network error");
    }
  }
}

class DonutsJsonSerializableClassRepositoryException implements Exception {
  const DonutsJsonSerializableClassRepositoryException(String message)
      : message = "[DonutsJsonSerializableClassRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
