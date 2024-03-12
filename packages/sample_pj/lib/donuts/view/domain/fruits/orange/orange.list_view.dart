// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:annotation_indexer_annotation/annotation_indexer_annotation.dart';
import 'package:sample_pj/donuts/state/domain/fruits/orange/orange.list_state_impl.dart';
import 'package:sample_pj/donuts/state/domain/fruits/orange/orange.single_state_impl.dart';
import 'package:sample_pj/donuts/view/domain/fruits/orange/orange.detail_view.dart';
import 'package:sample_pj/donuts/view/domain/fruits/orange/orange.create_modal.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

@IndexTarget()
class OrangeListView extends HookConsumerWidget {
  const OrangeListView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final listAsyncValue = ref.watch(orangeListStateImplProvider);

    return Scaffold(
      appBar: const OrangeHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await orangeCreateModal(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (orangeList) {
          if (orangeList.isEmpty) {
            return const Center(
              child: Text("is empty"),
            );
          }

          return ListView.builder(
            itemCount: orangeList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(orangeList[index].id.toString()),
                onTap: () async {
                  ref
                      .read(orangeSingleStateImplProvider.notifier)
                      .set(id: orangeList[index].id)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrangeDetailView(),
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

class OrangeHeader extends HookConsumerWidget implements PreferredSizeWidget {
  const OrangeHeader({Key? key}) : super(key: key);

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
                "[Orange]ListView",
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
