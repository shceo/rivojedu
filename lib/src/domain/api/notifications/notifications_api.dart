 import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';

Future<void> fetchAndShowNotifications() async {

dynamic id;

    try {
      var response = await Dio().get('http://143.110.188.247:8080/api/v1/admin/get-all-notification');
      for (var notification in response.data) {
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: notification['id'],
            channelKey: 'basic_channel',
            title: notification['title'],
            body: notification['body'],
          ),
        );
      }
    } catch (e) {
      print('Error fetching notifications: $e');
    }
}
