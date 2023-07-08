import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/layout/default_layout.dart';
import 'package:practice_riverpod/riverpod/state_notifier_provider.dart';

class StateNofierProviderScreen extends ConsumerWidget {
  const StateNofierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingListProvider);


    return DefaultLayout(
      title: 'StateNofierProvider',
      body: ListView(
        children: state
            .map((e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    ref.read(shoppingListProvider.notifier).toggleHasBought(name: e.name);
                  },
                ))
            .toList(),
      ),
    );
  }
}
