import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/layout/default_layout.dart';
import 'package:practice_riverpod/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
      title: 'StreamProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            data: (data) => Text(data.toString()),
            error: (error, stackTrace) => Text(error.toString()),
            loading:() =>  CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
