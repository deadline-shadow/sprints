import 'package:sprints_test/common/notification.dart';

/*
− Описание назначения класса
  Репозиторий данных уведомлений
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  30 минут
*/

class NotificationRepository extends INotificationRepository {
  @override
  Future<List<NotificationModel>> getUserNotifications(
    int userID,
    int limit,
    int offset,
  ) {
    // TODO: implement getUserNotifications
    throw UnimplementedError();
  }

  @override
  Future<NotificationModel> readNotification(int notificationID) {
    // TODO: implement readNotification
    throw UnimplementedError();
  }
}
