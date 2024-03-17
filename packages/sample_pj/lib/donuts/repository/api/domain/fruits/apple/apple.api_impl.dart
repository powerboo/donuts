// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApiImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:sample_pj/donuts/repository/api/domain/fruits/apple/apple.abstract_interface_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class AppleApiImpl implements AppleApi {
  @override
  Future<Apple?> find({required FruitsId id}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/apple/${id}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AppleApiException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw AppleApiException("body is not Map<String, dynamic>");
    }

    return Apple.fromJson(body);
  }

  @override
  Future<List<Apple>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/apple?cursor=${cursor}&length=${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AppleApiException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw AppleApiException("data is not List<Map<String, dynamic>>");
    }

    final List<Apple> result = [];
    for (final r in data) {
      result.add(Apple.fromJson(r));
    }
    return result;
  }

  @override
  Future<void> save({required Apple apple}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/apple",
      ),
      body: jsonEncode(apple.toJson()),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AppleApiException("network error");
    }
  }

  @override
  Future<void> delete({required FruitsId id}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/apple/${id}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw AppleApiException("network error");
    }
  }
}

class AppleApiException implements Exception {
  const AppleApiException(String message)
      : message = "[AppleApiException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
