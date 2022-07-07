// ignore: file_names
import 'dart:developer';

import 'package:http/http.dart' as http;

fetchData(String url) async {
  try {
    http.Response resp = await http.get(Uri.parse(url));
    return resp.body;
  } catch (e) {
    log(e.toString());
  }
}
