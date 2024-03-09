// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CreateModalGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_pj/domain/abstract_class.dart';
import 'package:sample_pj/donuts/state/domain/abstract_class.list_state_impl.dart';

Future<void> abstractClassCreateModal({required BuildContext context}) async {
  await showModalBottomSheet(
    context: context,
    builder: (_) {
      return HookConsumer(
        builder: (context, ref, child) {
          return Container();
        },
      );
    },
  );
}
