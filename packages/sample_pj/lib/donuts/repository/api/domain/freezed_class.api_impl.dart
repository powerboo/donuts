// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApiImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/freezed_class.dart';
import 'package:sample_pj/donuts/repository/api/domain/freezed_class.abstract_interface_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FreezedClassApiImpl implements FreezedClassApi {
  @override
  Future<FreezedClass?> find({required String key}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/freezed-class/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw FreezedClassApiException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw FreezedClassApiException("body is not Map<String, dynamic>");
    }

    return FreezedClass.fromJson(body);
  }

  @override
  Future<List<FreezedClass>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/freezed-class?cursor=${cursor}&length=${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw FreezedClassApiException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw FreezedClassApiException("data is not List<Map<String, dynamic>>");
    }

    final List<FreezedClass> result = [];
    for (final r in data) {
      result.add(FreezedClass.fromJson(r));
    }
    return result;
  }

  @override
  Future<void> save({required FreezedClass freezedClass}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/freezed-class",
      ),
      body: jsonEncode(freezedClass.toJson()),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw FreezedClassApiException("network error");
    }
  }

  @override
  Future<void> delete({required String key}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/freezed-class/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw FreezedClassApiException("network error");
    }
  }
}

class FreezedClassApiException implements Exception {
  const FreezedClassApiException(String message)
      : message = "[FreezedClassApiException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
