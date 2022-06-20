import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Logic/temp_and_humid.dart';

class FarmData extends ChangeNotifier {
  final String host = "http://192.168.0.105:8080";
  double? _temp = 0;
  double? _humid = 0;
  bool? _oE = false;
  bool? _fS = false;
  bool? _mS = false;

  // ignore: prefer_typing_uninitialized_variables
  var data;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void showNotification() async {

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
        'Object Entered', platformNotifChannel);
  }

  fetchDataFromJson() async {
    data = await fetchData(host);
    var decoded = jsonDecode(data);
    setTemperature(decoded['temperature']);
    setHumidity(decoded['humidity']);
    setfireStatus(decoded['flame_status']);
    setMoistureStatus(decoded['moisture_status']);
    setObjectStatus(decoded['motion_status']);
  }

  double get temperature => _temp!;
  double get humidity => _humid!;
  bool get objectEnteredStatus => _oE!;
  bool get fireStatus => _fS!;
  bool get moistureStatus => _mS!;

  void setTemperature(double tempValue) {
    _temp = tempValue;
    notifyListeners();
  }

  void setHumidity(double humidValue) {
    _humid = humidValue;
    notifyListeners();
  }

  void setObjectStatus(bool status) {
    _oE = status;
    showNotification();
    notifyListeners();
  }

  void setfireStatus(bool status) {
    _fS = status;
    notifyListeners();
  }

  void setMoistureStatus(bool status) {
    _mS = status;
    notifyListeners();
  }
}
