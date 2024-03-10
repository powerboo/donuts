// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_pj/donuts/state/domain/abstract_class.list_state_impl.dart';

Future<void> abstractClassCreateModal({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          // --------------  text field ----------------

          // --------------  state ----------------

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      ref
                          .read(abstractClassListStateImplProvider.notifier)
                          .create()
                          .then(
                        (value) {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: const Text("Create"),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
