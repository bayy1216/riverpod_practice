import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/layout/default_layout.dart';
import 'package:practice_riverpod/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesFutureProvider);
    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            data: (data){
              return Text(
                data.toString()
              );
            },
            error: (err, stack)=> Text(
              err.toString()
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
