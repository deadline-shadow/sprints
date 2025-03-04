import 'package:sprints_test/common/good.dart';

/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса любимых товаров
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class IFavoriteRepository {
  Future<FavoriteModel> addFavorite(int userID, int goodID);
  Future<void> removeFavorite(FavoriteModel favorite);
  Future<List<FavoriteModel>> getUserFavorites(
    int userID,
    int limit,
    int offset,
  );
  Future<bool> isFavorite(int userID, int goodID);
}

class FavoriteModel {
  int id;
  int userId;
  int goodId;
  DateTime createdAt;

  FavoriteModel({
    required this.id,
    required this.userId,
    required this.goodId,
    required this.createdAt,
  });
}

abstract class Favorite {
  Future<Good> getGood();

  Future<void> remove();
}

abstract class IFavoriteService {
  Future<List<Favorite>> getFavorites();
  Future<void> addFavorite(Good good);
  Future<bool> isFavorite(Good good);
}
