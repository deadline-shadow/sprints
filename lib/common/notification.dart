/*
− Описание назначения класса
  Интерфейсы для репозитория и сервиса уведомлений
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

abstract class INotificationRepository {
  Future<NotificationModel> readNotification(int notificationID);
  Future<List<NotificationModel>> getUserNotifications(
    int userID,
    int limit,
    int offset,
  );
}

class NotificationModel {
  int id;
  String title;
  String? description;
  DateTime? readAt;
  DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    this.description,
    this.readAt,
    required this.createdAt,
  });
}

abstract class Notification {
  String getTitle();
  String getDescription();
  DateTime? getReadAt();
  DateTime getCreatedAt();

  Future<void> read();
}

abstract class INotificationService {
  Future<List<Notification>> getNotifications();
}
