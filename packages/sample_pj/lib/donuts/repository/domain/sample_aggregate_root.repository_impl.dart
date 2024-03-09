// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepositoryImplGenerator
// **************************************************************************

import 'package:sample_pj/donuts/repository/domain/sample_aggregate_root.abstract_interface_repository.dart';
import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SampleAggregateRootRepositoryImpl
    implements SampleAggregateRootRepository {
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
      throw SampleAggregateRootRepositoryException("network error");
    }

    final body = jsonDecode(response.body);
    if (body is! Map<String, dynamic>) {
      throw SampleAggregateRootRepositoryException(
          "body is not Map<String, dynamic>");
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
      throw SampleAggregateRootRepositoryException("network error");
    }

    final data = jsonDecode(response.body);
    if (data is! List<Map<String, dynamic>>) {
      throw SampleAggregateRootRepositoryException(
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
      throw SampleAggregateRootRepositoryException("network error");
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
      throw SampleAggregateRootRepositoryException("network error");
    }
  }
}

class SampleAggregateRootRepositoryException implements Exception {
  const SampleAggregateRootRepositoryException(String message)
      : message = "[SampleAggregateRootRepositoryException]$message";

  final String message;

  @override
  String toString() {
    return message;
  }
}
