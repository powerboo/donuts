// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApiImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/orange/orange.dart';
import 'package:sample_pj/donuts/repository/api/domain/fruits/orange/orange.abstract_interface_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class OrangeApiImpl implements OrangeApi {
  @override
  Future<Orange?> find({required FruitsId id}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/orange/${id}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw OrangeApiException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw OrangeApiException("body is not Map<String, dynamic>");
    }

    return Orange.fromJson(body);
  }

  @override
  Future<List<Orange>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/orange?cursor=${cursor}&length=${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw OrangeApiException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw OrangeApiException("data is not List<Map<String, dynamic>>");
    }

    final List<Orange> result = [];
    for (final r in data) {
      result.add(Orange.fromJson(r));
    }
    return result;
  }

  @override
  Future<void> save({required Orange orange}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/orange",
      ),
      body: jsonEncode(orange.toJson()),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw OrangeApiException("network error");
    }
  }

  @override
  Future<void> delete({required FruitsId id}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/orange/${id}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw OrangeApiException("network error");
    }
  }
}

class OrangeApiException implements Exception {
  const OrangeApiException(String message)
      : message = "[OrangeApiException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
