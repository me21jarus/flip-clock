import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static void initialize() {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel',
        defaultColor: const Color(0xFF9D50DD),
        ledColor: const Color(0xFF9D50DD),
      )
    ]);
  }

  static void showNotification(String title, String body) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: title,
        body: body,
      ),
    );
  }
}
