// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListViewGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:annotation_indexer_annotation/annotation_indexer_annotation.dart';
import 'package:sample_pj/donuts/state/domain/freezed_class.list_state_impl.dart';
import 'package:sample_pj/donuts/view/domain/freezed_class.detail_view.dart';
import 'package:sample_pj/donuts/view/domain/freezed_class.create_modal.dart';

@IndexTarget()
class FreezedClassListView extends HookConsumerWidget {
  const FreezedClassListView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final listAsyncValue = ref.watch(freezedClassListStateImplProvider);

    return Scaffold(
      appBar: const FreezedClassHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await freezedClassCreateModal(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: listAsyncValue.when(
        data: (freezedClassList) {
          if (freezedClassList.isEmpty) {
            return const Center(
              child: Text("is empty"),
            );
          }

          return ListView.builder(
            itemCount: freezedClassList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(freezedClassList[index].key.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FreezedClassDetailView(),
                    ),
                  );
                },
              );
            },
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

class FreezedClassHeader extends HookConsumerWidget
    implements PreferredSizeWidget {
  const FreezedClassHeader({Key? key}) : super(key: key);

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
                "[FreezedClass]ListView",
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
