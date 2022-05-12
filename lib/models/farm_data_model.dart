import 'package:flutter/material.dart';

class FarmData extends ChangeNotifier {
  int? _temp;
  int? _humid;
  bool? _oE;
  bool? _fS;
  bool? _mS;

  int get temperature => _temp!;
  int get humidity => _humid!;
  bool get objectEnteredStatus => _oE!;
  bool get fireStatus => _fS!;
  bool get moistureStatus => _mS!;

  void setTemperature(int tempValue) {
    _temp = tempValue;
    notifyListeners();
  }

  void setHumidity(int humidValue) {
    _humid = humidValue;
    notifyListeners();
  }

  void setObjectStatus(bool status) {
    _oE = status;
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
