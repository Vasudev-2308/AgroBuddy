import 'dart:convert';

import 'package:agro_buddy/Logic/crop_recommend_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CropRecommender extends ChangeNotifier {
  final url = 'https://agro-buddy.herokuapp.com/crop_recommender';
  List<String> crops = [];
  double? _nVal;
  double? _pVal;
  double? _kVal;
  double? _tempVal;
  double? _humidVal;
  double? _pHVal;
  double? _rainfall;
  String? _cropName = "";

  double? get nVal => _nVal!;
  double? get pVal => _pVal!;
  double? get kVal => _kVal!;
  double? get tempVal => _tempVal!;
  double? get humidVal => _humidVal!;
  double? get pHVal => _pHVal!;
  double? get rainVal => _rainfall!;
  String? get cropName => _cropName!;

  SharedPreferences? prefs;

  fillValues(
      double n, double p, double k, double t, double h, double ph, double r) {
    _nVal = n;
    _pVal = p;
    _kVal = k;
    _tempVal = t;
    _humidVal = h;
    _pHVal = ph;
    _rainfall = r;
  }

  // ignore: prefer_typing_uninitialized_variables
  var data;
  void setCropName() async {
    prefs = await SharedPreferences.getInstance();
    Crop crop = Crop();
    data = crop.sendCrop(
        _nVal!, _pVal!, kVal!, tempVal!, humidVal!, pHVal!, rainVal!);

    try {
      final response = await http.get(Uri.parse(url),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      data = response.body;
      var decoded = jsonDecode(data);
      _cropName = decoded['response'];
      if (_cropName!.isNotEmpty) {
        crops.add(_cropName!);
        prefs!.setStringList('crops_list', crops);
      }
      debugPrint(_cropName);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Provider Handling Notifications

}
