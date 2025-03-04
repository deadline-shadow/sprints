/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса авторизации
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class IAuthRepository {
  Future<int> signIn(String email, String password);
  Future<int> signUp(String email, String password);
  Future<void> logout();
}

class UserModel {
  final int id;

  UserModel({required this.id});
}

abstract class IAuthService {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(String email, String password);
  Future<void> logout();
}
