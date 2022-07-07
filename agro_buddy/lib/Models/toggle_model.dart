import 'package:agro_buddy/Services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerStateProvider extends ChangeNotifier {
  bool _notifState = false;
  bool _appUpdateState = false;

  FlutterNotificationService notificationService = FlutterNotificationService();

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

  showNotification(bool val) {
    notificationService.showNotification(val, "Push Notifications Turned On");
  }
}
