import 'dart:async';
import 'dart:collection';
import 'package:sprints_test/common/good.dart';

/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса заказов
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class IOrderRepository {
  Future<OrderModel> createOrder(
    int userID,
    String phone,
    String address,
    String paymentMethod,
  );
  Future<void> updateOrder(OrderModel order);
  Future<void> deleteOrder(OrderModel order);
  Future<List<OrderModel>> getUserOrders(int userID, int limit, int offset);

  Future<void> addOrderItem(int orderID, int goodID, int count);
  Future<void> removeOrderItem(OrderItemModel orderItem);
  Future<void> updateOrderItem(OrderItemModel orderItem);
  Future<List<OrderItemModel>> getOrderItems(OrderModel order);

  Future<OrderModel> createOrderWithGoods(
    int userID,
    String phone,
    String address,
    String paymentMethod,
    HashMap<int, int> goodsIDsCounts,
  );
}

class OrderModel {
  int id;
  int userID;
  String? phone;
  String? email;
  String address;
  String paymentMethod;
  DateTime createdAt;
  DateTime? completedAt;
  DateTime? deletedAt;

  OrderModel({
    required this.id,
    required this.userID,
    this.phone,
    this.email,
    required this.address,
    required this.paymentMethod,
    required this.createdAt,
    this.completedAt,
    this.deletedAt,
  });
}

class OrderItemModel {
  int id;
  int orderID;
  int goodID;
  int count;

  OrderItemModel({
    required this.id,
    required this.orderID,
    required this.goodID,
    required this.count,
  });
}

class OrderGood {
  final Good good;
  int count;

  OrderGood({required this.good, required this.count});
}

abstract class Order {
  Future<List<OrderGood>> getOrderGoods();
  Future<void> setEmail(String email);
  Future<void> setPhone(String phone);
  Future<void> setAddress(String address);
  Future<void> setPaymentMethod(String paymentMethod);
}

abstract class IOrderService {
  Future<List<Order>> getOrders();
  Future<void> makeCartOrder(
    String? phone,
    String? address,
    String? paymentMethod,
  );
  Future<void> makeOrder(
    String? phone,
    String? address,
    String? paymentMethod,
    List<OrderGood> goods,
  );
}
