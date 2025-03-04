import 'package:sprints_test/common/cart.dart';

/*
− Описание назначения класса
  Репозиторий данных корзины
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class CartRepository extends ICartRepository {
  @override
  Future<CartItemModel> addCartItem(int userID, int goodID) {
    // TODO: implement addCartItem
    throw UnimplementedError();
  }

  @override
  Future<List<CartItemModel>> getCartForUser(
    int userID,
    int limit,
    int offset,
  ) {
    // TODO: implement getCartForUser
    throw UnimplementedError();
  }

  @override
  Future<void> removeCartItem(CartItemModel cartItem) {
    // TODO: implement removeCartItem
    throw UnimplementedError();
  }
}
