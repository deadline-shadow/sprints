import 'package:sprints_test/common/good.dart';

/*
− Описание назначения класса
  Репозиторий данных товаров
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class GoodRepository extends IGoodRepository {
  @override
  Future<GoodModel> addGood(
    String title,
    String? description,
    double priceRuble,
    String? picture,
    String? category,
  ) {
    // TODO: implement addGood
    throw UnimplementedError();
  }

  @override
  Future<void> deleteGood(GoodModel good) {
    // TODO: implement deleteGood
    throw UnimplementedError();
  }

  @override
  Future<List<GoodModel>> findGoodsContaining(
    String text,
    int limit,
    int offset,
  ) {
    // TODO: implement findGoodsContaining
    throw UnimplementedError();
  }

  @override
  Future<List<GoodModel>> getCategoryGoods(
    String category,
    int limit,
    int offset,
  ) {
    // TODO: implement getCategoryGoods
    throw UnimplementedError();
  }

  @override
  Future<GoodModel?> getGood(int goodID) {
    // TODO: implement getGood
    throw UnimplementedError();
  }

  @override
  Future<List<GoodModel>> getGoods(int limit, int offset) {
    // TODO: implement getGoods
    throw UnimplementedError();
  }
}
