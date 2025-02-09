import '../config/router/app_router.dart';
import 'notification_type.dart';

abstract class NotificationManager {
  void redirection(Map<String, dynamic> data) {
    // check notification type
    final notificationType = data['notification_type'] as String?;
    if (notificationType == null) return;
    final type = NotificationType.fromValue(notificationType);
    if (type == NotificationType.none) return;

    final context = rootNavigatorKey.currentState?.context;
    if (context == null) return;

    try {
      switch (type) {
        case NotificationType.openApp:
          break;
        default:
          return;
      }
    } catch (_) {}
  }
}
