import 'package:sprints_test/common/good.dart';

/*
− Описание назначения класса
  Сервис для управления товарами
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class GoodService extends IGoodService {
  @override
  Future<Good?> findGoodByID(int goodID) {
    // TODO: implement findGoodByID
    throw UnimplementedError();
  }

  @override
  Future<List<Good>> findGoodsContaining(String text, int page) {
    // TODO: implement findGoodsContaining
    throw UnimplementedError();
  }

  @override
  Future<List<Good>> getCategoryGoods(String category, int page) {
    // TODO: implement getCategoryGoods
    throw UnimplementedError();
  }

  @override
  Future<List<Good>> getGoods(int page) {
    // TODO: implement getGoods
    throw UnimplementedError();
  }

  @override
  Future<String?> findCategoryByID(int categoryId) {
    // TODO: implement findCategoryByID
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
