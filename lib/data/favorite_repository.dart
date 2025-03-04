import 'package:sprints_test/common/favorite.dart';

/*
− Описание назначения класса
  Репозиторий данных любимых заказов
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class FavoriteRepository extends IFavoriteRepository {
  @override
  Future<FavoriteModel> addFavorite(int userID, int goodID) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteModel>> getUserFavorites(
    int userID,
    int limit,
    int offset,
  ) {
    // TODO: implement getUserFavorites
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavorite(int userID, int goodID) {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavorite(FavoriteModel favorite) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }
}
