// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ApiImplGenerator
// **************************************************************************

import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/repository/api/domain/sample_aggregate_root.abstract_interface_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SampleAggregateRootApiImpl implements SampleAggregateRootApi {
  @override
  Future<SampleAggregateRoot?> find({required ObjectId key}) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/sample-aggregate-root/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw SampleAggregateRootApiException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw SampleAggregateRootApiException("body is not Map<String, dynamic>");
    }

    return SampleAggregateRoot.fromJson(body);
  }

  @override
  Future<List<SampleAggregateRoot>> all({
    int cursor = 0,
    int length = 100,
  }) async {
    final response = await http.get(
      Uri.https(
        'https://www.google.com',
        "/v1/sample-aggregate-root?cursor=${cursor}&length=${length}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw SampleAggregateRootApiException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw SampleAggregateRootApiException(
          "data is not List<Map<String, dynamic>>");
    }

    final List<SampleAggregateRoot> result = [];
    for (final r in data) {
      result.add(SampleAggregateRoot.fromJson(r));
    }
    return result;
  }

  @override
  Future<void> save({required SampleAggregateRoot sampleAggregateRoot}) async {
    final response = await http.post(
      Uri.https(
        'https://www.google.com',
        "/v1/sample-aggregate-root",
      ),
      body: jsonEncode(sampleAggregateRoot.toJson()),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw SampleAggregateRootApiException("network error");
    }
  }

  @override
  Future<void> delete({required ObjectId key}) async {
    final response = await http.delete(
      Uri.https(
        'https://www.google.com',
        "/v1/sample-aggregate-root/${key}",
      ),
      headers: {},
    );

    if (response.statusCode != 200) {
      throw SampleAggregateRootApiException("network error");
    }
  }
}

class SampleAggregateRootApiException implements Exception {
  const SampleAggregateRootApiException(String message)
      : message = "[SampleAggregateRootApiException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
