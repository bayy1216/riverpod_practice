import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/layout/default_layout.dart';
import 'package:practice_riverpod/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final state = ref.watch(selectProvider.select((value) => value.isSpicy));//state가 value.isSpicy의 값만 다루게 됨.이 값이 바뀔때만 reBuild
    final state = ref.watch(selectProvider);
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {//select는 성능향상을 위해 사용,value.hasBought이 바뀔때만 reBuild
      print('next is $next');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.name),
          Text(state.isSpicy.toString()),
          Text(state.hasBought.toString()),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleIsSpicy();
            },
            child: Text('Spicy Toggle'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleHasBought();
            },
            child: Text('HasBought Toggle'),
          ),
        ],
      ),
    );
  }
}
