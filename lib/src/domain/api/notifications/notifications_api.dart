 import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';

Future<void> fetchAndShowNotifications() async {

dynamic id;

    try {
      var response = await Dio().get('http://165.232.73.1:8080/api/v1/admin/get-notification${id}');
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
