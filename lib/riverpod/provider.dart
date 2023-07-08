import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/model/shopping_item_model.dart';
import 'package:practice_riverpod/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);//애들이 바뀔때 이 provider도 바뀌게 판정
  final shoppingListState = ref.watch(shoppingListProvider);

  if (filterState == FilterState.all) {//all이면 모두 리턴
    return shoppingListState;
  }
  return shoppingListState//isSpicy이면 스파이시만 리턴, 아니면 아닌 애들만 리턴해서 List<ShoppingItemModel>가 리턴하게 되는 역할
      .where(
        (element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy,
      )
      .toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
