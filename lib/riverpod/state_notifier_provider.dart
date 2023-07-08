import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(//어떤 StateNotifier할지, 어떤 자료형 다룰지
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {//어떤 자료형 다룰지 정의
  ShoppingListNotifier()//생성자시 초기에 넣을거
      : super([
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: '라면',
            quantity: 5,
            hasBought: false,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: '수박',
            quantity: 2,
            hasBought: false,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: '포도',
            quantity: 6,
            hasBought: false,
            isSpicy: false,
          ),
        ]);

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
