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
    path: ListViewPath.abstractClassListView.route,
    builder: (context, state) => const AbstractClassListView(),
  ),
  GoRoute(
    path: ListViewPath.donutsJsonSerializableClassListView.route,
    builder: (context, state) => const DonutsJsonSerializableClassListView(),
  ),
  GoRoute(
    path: ListViewPath.freezedClassListView.route,
    builder: (context, state) => const FreezedClassListView(),
  ),
  GoRoute(
    path: ListViewPath.sampleAggregateRootListView.route,
    builder: (context, state) => const SampleAggregateRootListView(),
  ),
];

class ListViewPath {
  static const Path abstractClassListView = Path("AbstractClassListView");
  static const Path donutsJsonSerializableClassListView =
      Path("DonutsJsonSerializableClassListView");
  static const Path freezedClassListView = Path("FreezedClassListView");
  static const Path sampleAggregateRootListView =
      Path("SampleAggregateRootListView");
}

final List<Path> paths = [
  ListViewPath.abstractClassListView,
  ListViewPath.donutsJsonSerializableClassListView,
  ListViewPath.freezedClassListView,
  ListViewPath.sampleAggregateRootListView,
];

class Path {
  final String name;

  const Path(this.name);

  String get route {
    return name.toKebabCase();
  }

  String get fullPath {
    return "/${name.toKebabCase()}";
  }

  @override
  String toString() => name;
}

extension KebabCase on String {
  String toKebabCase() {
    final regExp = RegExp(r'(?<=[a-z])[A-Z]');
    return replaceAllMapped(
            regExp, (Match match) => '-${match.group(0)!.toLowerCase()}')
        .toLowerCase();
  }
}
