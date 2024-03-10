// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DetailViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_pj/domain/donuts_json_serializable_class.dart';
import 'package:sample_pj/donuts/state/domain/donuts_json_serializable_class.single_state_impl.dart';

class DonutsJsonSerializableClassDetailView extends HookConsumerWidget {
  const DonutsJsonSerializableClassDetailView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final AsyncValue<DonutsJsonSerializableClass?> value =
        ref.watch(donutsJsonSerializableClassSingleStateImplProvider);
    return Scaffold(
      appBar: const DonutsJsonSerializableClassHeader(),
      body: value.when(
        data: (data) {
          if (data == null) {
            return Column(
              children: [
                const Text("Error"),
                const Divider(),
                const SizedBox(height: 20),
                const Text("value is null"),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("back"),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("String key :"),
                    Text(data.key.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text("String? nullableString :"),
                    Text(data.nullableString.toString()),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Column(
            children: [
              const Text("Error"),
              const Divider(),
              Text(error.toString()),
              const SizedBox(height: 20),
              const Text("StackTrace"),
              const Divider(),
              Text(stackTrace.toString()),
            ],
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class DonutsJsonSerializableClassHeader extends HookConsumerWidget
    implements PreferredSizeWidget {
  const DonutsJsonSerializableClassHeader({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
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
                "[DonutsJsonSerializableClass]DetailView",
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
