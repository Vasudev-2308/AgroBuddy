// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

class Crop {
  final url = 'https://agro-buddy.herokuapp.com/crop_recommender';
  sendCrop(double nVal, double pVal, double kVal, double tempVal,
      double humidVal, double pHVal, double rainVal) async {
    final request = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'n_val': nVal,
          'p_val': pVal,
          'k_val': kVal,
          'temp_val': tempVal,
          'hum_val': humidVal,
          'ph_val': pHVal,
          'rf_val': rainVal
        }));
  }

  
}
