import 'package:sprints_test/common/order.dart';

/*
− Описание назначения класса
  Сервис для управления заказами
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class OrderService extends IOrderService {
  @override
  Future<List<Order>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<void> makeCartOrder(
    String? phone,
    String? address,
    String? paymentMethod,
  ) {
    // TODO: implement makeCartOrder
    throw UnimplementedError();
  }

  @override
  Future<void> makeOrder(
    String? phone,
    String? address,
    String? paymentMethod,
    List<OrderGood> goods,
  ) {
    // TODO: implement makeOrder
    throw UnimplementedError();
  }
}
