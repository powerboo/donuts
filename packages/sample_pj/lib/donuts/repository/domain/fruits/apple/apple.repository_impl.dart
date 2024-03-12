// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/fruits/apple/apple.abstract_interface_repository.dart';
import 'package:sample_pj/domain/fruits/apple/apple.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

class AppleRepositoryImpl implements AppleRepository {
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
      throw AppleRepositoryException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw AppleRepositoryException("body is not Map<String, dynamic>");
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
      throw AppleRepositoryException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw AppleRepositoryException("data is not List<Map<String, dynamic>>");
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
      throw AppleRepositoryException("network error");
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
      throw AppleRepositoryException("network error");
    }
  }
}

class AppleRepositoryException implements Exception {
  const AppleRepositoryException(String message)
      : message = "[AppleRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
