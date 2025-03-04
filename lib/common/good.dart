/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса товаров
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class IGoodRepository {
  Future<GoodModel> addGood(
    String title,
    String? description,
    double priceRuble,
    String? picture,
    String? category,
  );
  Future<void> deleteGood(GoodModel good);
  Future<GoodModel?> getGood(int goodID);
  Future<List<GoodModel>> getGoods(int limit, int offset);
  Future<List<GoodModel>> findGoodsContaining(
    String text,
    int limit,
    int offset,
  );
  Future<List<GoodModel>> getCategoryGoods(
    String category,
    int limit,
    int offset,
  );
}

class GoodModel {
  int id;
  String title;
  String? description;
  double priceRuble;
  String? picture;
  String? category;
  DateTime createdAt;
  DateTime? deletedAt;

  GoodModel({
    required this.id,
    required this.title,
    this.description,
    required this.priceRuble,
    this.picture,
    this.category,
    required this.createdAt,
    this.deletedAt,
  });
}

abstract class Good {
  int getID();
  String getTitle();
  String getDescription();
  double getPrice();
  String getPicture();
  String getCategory();
  DateTime getCreatedAt();
  Future<bool> isFavorite();
}

abstract class IGoodService {
  Future<List<Good>> getGoods(int page);
  Future<List<Good>> getCategoryGoods(String category, int page);
  Future<Good?> findGoodByID(int goodID);
  Future<List<Good>> findGoodsContaining(String text, int page);
}
