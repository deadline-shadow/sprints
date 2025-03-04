import 'dart:collection';

import 'package:sprints_test/common/order.dart';

/*
− Описание назначения класса
  Репозиторий данных заказов
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class OrderRepository extends IOrderRepository {
  @override
  Future<void> addOrderItem(int orderID, int goodID, int count) {
    // TODO: implement addOrderItem
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> createOrder(
    int userID,
    String phone,
    String address,
    String paymentMethod,
  ) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> createOrderWithGoods(
    int userID,
    String phone,
    String address,
    String paymentMethod,
    HashMap<int, int> goodsIDsCounts,
  ) {
    // TODO: implement createOrderWithGoods
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrder(OrderModel order) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderItemModel>> getOrderItems(OrderModel order) {
    // TODO: implement getOrderItems
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getUserOrders(int userID, int limit, int offset) {
    // TODO: implement getUserOrders
    throw UnimplementedError();
  }

  @override
  Future<void> removeOrderItem(OrderItemModel orderItem) {
    // TODO: implement removeOrderItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrder(OrderModel order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrderItem(OrderItemModel orderItem) {
    // TODO: implement updateOrderItem
    throw UnimplementedError();
  }
}
