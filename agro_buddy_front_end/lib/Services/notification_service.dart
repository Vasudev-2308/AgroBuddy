import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FlutterNotificationService{
  void showNotification(bool val, String content) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
   
    var androidChannel = const AndroidNotificationDetails(
      'AgroBuddy',
      'Channel for Notification',
      icon: 'logo',
    );

    var iosChannel = const IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    var platformNotifChannel = NotificationDetails(
      android: androidChannel,
      iOS: iosChannel,
      
    );

    await flutterLocalNotificationsPlugin.show(0, 'AgroBuddy',
        content, platformNotifChannel);
  }

}