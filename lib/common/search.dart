import 'package:sprints_test/common/good.dart';

/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса поиска
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class ISearchRepository {
  Future<SearchModel> saveSearch(int userID, String search);
  Future<void> deleteSearch(SearchModel search);
  Future<List<SearchModel>> getUserSearches(int userID, int limit);
}

class SearchModel {
  int id;
  int userID;
  String search;
  DateTime createdAt;

  SearchModel({
    required this.id,
    required this.userID,
    required this.search,
    required this.createdAt,
  });
}

abstract class ISearchService {
  Future<List<Good>> searchGood(String name, int page);
}
