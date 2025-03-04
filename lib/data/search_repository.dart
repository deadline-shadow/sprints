import 'package:sprints_test/common/search.dart';

/*
− Описание назначения класса
  Репозиторий данных поисковых запросов
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class SearchRepository extends ISearchRepository {
  @override
  Future<void> deleteSearch(SearchModel search) {
    // TODO: implement deleteSearch
    throw UnimplementedError();
  }

  @override
  Future<List<SearchModel>> getUserSearches(int userID, int limit) {
    // TODO: implement getUserSearches
    throw UnimplementedError();
  }

  @override
  Future<SearchModel> saveSearch(int userID, String search) {
    // TODO: implement saveSearch
    throw UnimplementedError();
  }
}
