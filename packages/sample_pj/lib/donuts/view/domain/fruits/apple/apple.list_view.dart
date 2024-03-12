// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:annotation_indexer_annotation/annotation_indexer_annotation.dart';
import 'package:sample_pj/donuts/state/domain/fruits/apple/apple.list_state_impl.dart';
import 'package:sample_pj/donuts/state/domain/fruits/apple/apple.single_state_impl.dart';
import 'package:sample_pj/donuts/view/domain/fruits/apple/apple.detail_view.dart';
import 'package:sample_pj/donuts/view/domain/fruits/apple/apple.create_modal.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

@IndexTarget()
class AppleListView extends HookConsumerWidget {
  const AppleListView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final listAsyncValue = ref.watch(appleListStateImplProvider);

    return Scaffold(
      appBar: const AppleHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await appleCreateModal(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (appleList) {
          if (appleList.isEmpty) {
            return const Center(
              child: Text("is empty"),
            );
          }

          return ListView.builder(
            itemCount: appleList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(appleList[index].id.toString()),
                onTap: () async {
                  ref
                      .read(appleSingleStateImplProvider.notifier)
                      .set(id: appleList[index].id)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppleDetailView(),
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

class AppleHeader extends HookConsumerWidget implements PreferredSizeWidget {
  const AppleHeader({Key? key}) : super(key: key);

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
                "[Apple]ListView",
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
