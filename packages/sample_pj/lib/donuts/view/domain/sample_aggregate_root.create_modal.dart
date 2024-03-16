// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_pj/donuts/state/domain/sample_aggregate_root.list_state_impl.dart';

Future<void> sampleAggregateRootCreateModal(
    {required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          // --------------  text field ----------------
          final valueController = useTextEditingController();

          // --------------  state ----------------
          final valueState = useState<String?>(null);

          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("value"),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: valueController,
                          onChanged: (value) {
                            final val = value as String;
                            valueState.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final value = valueState.value;

                      if (value == null) {
                        return;
                      }

                      ref
                          .read(
                              sampleAggregateRootListStateImplProvider.notifier)
                          .create(
                            value: value,
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
