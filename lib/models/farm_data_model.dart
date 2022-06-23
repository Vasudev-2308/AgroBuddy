import 'dart:convert';

import 'package:agro_buddy/Services/notification_service.dart';
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
  String? _objectName;

  // ignore: prefer_typing_uninitialized_variables
  var data;
  FlutterNotificationService flutterNotificationService =
      FlutterNotificationService();

  fetchDataFromJson() async {
    data = await fetchData(host);
    var decoded = jsonDecode(data);
    setTemperature(decoded['temperature']);
    setHumidity(decoded['humidity']);
    setfireStatus(decoded['flame_status']);
    setMoistureStatus(decoded['moisture_status']);
    setObjectStatus(decoded['motion_status']);
    _objectName = decoded['object'].toString().toUpperCase();
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
    if (_oE!) {
      flutterNotificationService.showNotification(_oE!, "Object Detected : $_objectName");
    }
    notifyListeners();
  }

  void setfireStatus(bool status) {
    _fS = status;
    if (_fS!) {
      flutterNotificationService.showNotification(_fS!, "Fire Detected");
    }
    notifyListeners();
  }

  void setMoistureStatus(bool status) {
    _mS = status;
    notifyListeners();
  }
}
