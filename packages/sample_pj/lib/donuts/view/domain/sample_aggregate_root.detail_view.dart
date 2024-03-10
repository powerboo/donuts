// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DetailViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_pj/domain/sample_aggregate_root.dart';
import 'package:sample_pj/donuts/state/domain/sample_aggregate_root.single_state_impl.dart';

class SampleAggregateRootDetailView extends HookConsumerWidget {
  const SampleAggregateRootDetailView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final AsyncValue<SampleAggregateRoot?> value =
        ref.watch(sampleAggregateRootSingleStateImplProvider);
    return Scaffold(
      appBar: const SampleAggregateRootHeader(),
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
                    Text("ObjectId key "),
                    Text(data.key.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("String value "),
                    Text(data.value.toString()),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => method1ExecShowModal(context: context),
                      child: const Text("method1"),
                    ),
                  ],
                ),
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

Future<void> method1ExecShowModal({required BuildContext context}) async {
  /* 
ref.read(sampleAggregateRootSingleStateImplProvider.notifier)
.method1("",
b:1,
val:null,
)
*/

  await showModalBottomSheet(
    context: context,
    builder: (context) => const Text("method1"),
  );
}

class SampleAggregateRootHeader extends HookConsumerWidget
    implements PreferredSizeWidget {
  const SampleAggregateRootHeader({Key? key}) : super(key: key);

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
                "[SampleAggregateRoot]DetailView",
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
