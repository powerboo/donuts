// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:annotation_indexer_annotation/annotation_indexer_annotation.dart';
import 'package:sample_pj/donuts/state/domain/sample_aggregate_root.list_state_impl.dart';
import 'package:sample_pj/donuts/state/domain/sample_aggregate_root.single_state_impl.dart';
import 'package:sample_pj/donuts/view/domain/sample_aggregate_root.detail_view.dart';
import 'package:sample_pj/donuts/view/domain/sample_aggregate_root.create_modal.dart';

@IndexTarget()
class SampleAggregateRootListView extends HookConsumerWidget {
  const SampleAggregateRootListView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final listAsyncValue = ref.watch(sampleAggregateRootListStateImplProvider);

    return Scaffold(
      appBar: const SampleAggregateRootHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sampleAggregateRootCreateModal(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (sampleAggregateRootList) {
          if (sampleAggregateRootList.isEmpty) {
            return const Center(
              child: Text("is empty"),
            );
          }

          return ListView.builder(
            itemCount: sampleAggregateRootList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(sampleAggregateRootList[index].key.toString()),
                onTap: () async {
                  ref
                      .read(sampleAggregateRootSingleStateImplProvider.notifier)
                      .set(key: sampleAggregateRootList[index].key)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SampleAggregateRootDetailView(),
                      ),
                    );
                  });
                },
              );
            },
          );
        },
        error: (error, stackTrace) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const Text("Error"),
                const Divider(),
                Text(error.toString()),
                const SizedBox(height: 20),
                const Text("StackTrace"),
                const Divider(),
                Text(stackTrace.toString()),
              ],
            ),
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
                "[SampleAggregateRoot]ListView",
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
