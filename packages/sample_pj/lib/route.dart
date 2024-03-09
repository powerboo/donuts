// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// List View Routes
// **************************************************************************

import 'package:go_router/go_router.dart';
import 'package:sample_pj/donuts/view/domain/abstract_class.list_view.dart';
import 'package:sample_pj/donuts/view/domain/donuts_json_serializable_class.list_view.dart';
import 'package:sample_pj/donuts/view/domain/freezed_class.list_view.dart';
import 'package:sample_pj/donuts/view/domain/sample_aggregate_root.list_view.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: ListViewPath.abstractClassListView,
    builder: (context, state) => const AbstractClassListView(),
  ),
  GoRoute(
    path: ListViewPath.donutsJsonSerializableClassListView,
    builder: (context, state) => const DonutsJsonSerializableClassListView(),
  ),
  GoRoute(
    path: ListViewPath.freezedClassListView,
    builder: (context, state) => const FreezedClassListView(),
  ),
  GoRoute(
    path: ListViewPath.sampleAggregateRootListView,
    builder: (context, state) => const SampleAggregateRootListView(),
  ),
];

class ListViewPath {
  static const abstractClassListView = "/abstract-class-list-view";
  static const donutsJsonSerializableClassListView =
      "/donuts-json-serializable-class-list-view";
  static const freezedClassListView = "/freezed-class-list-view";
  static const sampleAggregateRootListView = "/sample-aggregate-root-list-view";
}
