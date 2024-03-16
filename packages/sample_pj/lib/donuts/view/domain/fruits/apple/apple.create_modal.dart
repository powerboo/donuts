// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_pj/donuts/state/domain/fruits/apple/apple.list_state_impl.dart';
import 'package:sample_pj/domain/fruits/common/value_object/fruits_id.dart';

Future<void> appleCreateModal({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          // --------------  text field ----------------
          final appleController = useTextEditingController();

          // --------------  state ----------------
          final appleState = useState<String?>(null);

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("apple"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: appleController,
                          onChanged: (value) {
                            final val = value as String;
                            appleState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final apple = appleState.value;

                      if (apple == null) {
                        return;
                      }

                      ref
                          .read(appleListStateImplProvider.notifier)
                          .create(
                            apple: apple,
                          )
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
