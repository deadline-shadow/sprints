/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса пользователей
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class IUserRepository {
  Future<UserModel> createUser(String firstName, String lastName);
  Future<void> updateUser(UserModel user);
  Future<UserModel?> getUser(int userID);

  Future<UserDataModel?> getUserData(int userID);
  Future<void> updateUserData(UserDataModel userData);
}

class UserModel {
  int id;
  String firstName;
  String lastName;
  DateTime createdAt;
  DateTime? deletedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    this.deletedAt,
  });
}

class UserDataModel {
  int id;
  int userID;
  String? email;
  String? phone;
  String? address;
  String? paymentMethod;

  UserDataModel({
    required this.id,
    required this.userID,
    this.email,
    this.phone,
    this.address,
    this.paymentMethod,
  });
}

abstract class User {
  String getFirstName();
  String getLastName();
  String? getAddress();
  String? getPhone();
  String? getEmail();
  String? getPaymentMethod();

  Future<void> setFirstName(String firstName);
  Future<void> setLastName(String lastName);
  Future<void> setAddress(String address);
  Future<void> setPhone(String phone);
  Future<void> setEmail(String email);
  Future<void> setPaymentMethod(String paymentMethod);
}

abstract class IUserService {
  Future<User> getUserInfo();
}
