import 'package:sprints_test/common/auth.dart';

/*
− Описание назначения класса
  Репозиторий данных авторизации
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class AuthRepository extends IAuthRepository {
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<int> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<int> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
