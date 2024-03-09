import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sample_pj/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting().then(
    (_) => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "donuts sample app",
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(routes: routes),
    );
  }
}

class MainException implements Exception {
  late final String message;
  MainException(final String message) {
    this.message = "[MainException] $message";
  }
  @override
  String toString() {
    return message;
  }
}
