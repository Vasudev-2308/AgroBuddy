import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerStateProvider extends ChangeNotifier {
  bool _notifState = false;
  bool _appUpdateState = false;
  
  bool get notifState => _notifState;
  bool get appUpdateState => _appUpdateState;

  SharedPreferences? prefs;

  changeNotifState(bool value) async {
    _notifState = value;
    prefs = await SharedPreferences.getInstance();
    prefs?.setBool('push_value', notifState);
    notifyListeners();
  }

  changeAppUpdateState(bool value) async {
    _appUpdateState = value;
    prefs = await SharedPreferences.getInstance();
    prefs?.setBool('_appUpdatevalue', _appUpdateState);
    notifyListeners();
  }

  void showNotification(bool val) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    String status = val == true ? "ON" : "OFF";

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
        'Push Notifications Turned ${status}', platformNotifChannel);
  }
}
