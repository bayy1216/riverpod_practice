import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/layout/default_layout.dart';
import 'package:practice_riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 11,
      number2: 5,
    ));
    //final state5 = ref.watch(gStateNotifierProvider);
    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('state1 : $state1'),
          state2.when(
            data: (data) {
              return Text('state2 : $data');
            },
            error: (err, stack) => Text(err.toString()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          state3.when(
            data: (data) {
              return Text('state3 : $data');
            },
            error: (err, stack) => Text(err.toString()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          Text('state4 : $state4'),
          Consumer(
            builder: (context, ref, child) {// 부분적으로 렌더링 하기때문에 child를 넣었음(child는 렌더링 계속 안된다는거)
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('state5 : $state5'),
                  if (child != null) child,
                ],
              );
            },
            child: Text('childe Text'),
          ),
          //
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('-'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              //유효하지 않게하다. 초기상태로 하는거
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('invalidate'),
          ),
        ],
      ),
    );
  }
}
