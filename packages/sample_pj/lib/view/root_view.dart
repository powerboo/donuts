import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:sample_pj/route.dart';

final log = Logger("RootView");

class RootView extends HookConsumerWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Path> pathList = paths;
    return Scaffold(
      appBar: const RootViewHeader(),
      body: ListView.builder(
        itemCount: paths.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                context.go(pathList[index].fullPath);
              },
              child: Text(
                pathList[index].name,
              ),
            ),
          );
        },
      ),
    );
  }
}

class RootViewHeader extends ConsumerWidget implements PreferredSizeWidget {
  const RootViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.orange,
      shadowColor: Colors.transparent,
      title: const Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class RootViewException implements Exception {
  late final String message;
  RootViewException(final String message) {
    this.message = "[RootViewException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
