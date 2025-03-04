import 'package:sprints_test/common/good.dart';

/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса корзины
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class ICartRepository {
  Future<CartItemModel> addCartItem(int userID, int goodID);
  Future<void> removeCartItem(CartItemModel cartItem);
  Future<List<CartItemModel>> getCartForUser(int userID, int limit, int offset);
}

class CartItemModel {
  int id;
  int userID;
  int goodID;
  DateTime createdAt;

  CartItemModel({
    required this.id,
    required this.userID,
    required this.goodID,
    required this.createdAt,
  });
}

abstract class ICartService {
  Future<List<Good>> getCart();
  Future<void> addCartGood(Good good);
}
