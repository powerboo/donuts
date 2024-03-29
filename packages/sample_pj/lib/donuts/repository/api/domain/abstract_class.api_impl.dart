// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApiImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/abstract_class.dart';
import 'package:sample_pj/donuts/repository/api/domain/abstract_class.abstract_interface_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample_pj/domain/abstract_class.dart';

class AbstractClassApiImpl implements AbstractClassApi {
  final AbstractClassJsonConverter converter =
      const AbstractClassJsonConverter();

  @override
  Future<AbstractClass?> find({required String key}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/abstract-class/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AbstractClassApiException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw AbstractClassApiException("body is not Map<String, dynamic>");
    }

    return converter.fromJson(body);
  }

  @override
  Future<List<AbstractClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/abstract-class?cursor=${cursor}&length=${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AbstractClassApiException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw AbstractClassApiException("data is not List<Map<String, dynamic>>");
    }

    final List<AbstractClass> result = [];
    for (final r in data) {
      result.add(converter.fromJson(r));
    }
    return result;
  }

  @override
  Future<void> save({required AbstractClass abstractClass}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/abstract-class",
      ),
      body: jsonEncode(converter.toJson(abstractClass)),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AbstractClassApiException("network error");
    }
  }

  @override
  Future<void> delete({required String key}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/abstract-class/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AbstractClassApiException("network error");
    }
  }
}

class AbstractClassApiException implements Exception {
  const AbstractClassApiException(String message)
      : message = "[AbstractClassApiException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
