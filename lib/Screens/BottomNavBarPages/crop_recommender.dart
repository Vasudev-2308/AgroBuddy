import 'package:agro_buddy/UI/npk_row.dart';
import 'package:agro_buddy/UI/ph_and_rain_row.dart';
import 'package:agro_buddy/UI/temp_and_humid_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommenderScreen extends StatelessWidget {
  const RecommenderScreen({Key? key}) : super(key: key);
  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Crop Recommender",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),

            Text("RICE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Divider(
                  color: Colors.black26, height: 20, thickness: 2),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Choose the best crop for your land",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Please help us with a few details that would help us suggest best crop for your land",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
            const  NPK_Row(),
            const SizedBox(
              height: 20,
            ),
            const TempandHumidRow(),
            const SizedBox(
              height: 20,
            ),
            const PHandRainfallRow(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  onPressed: null,
                  label: Text("Submit")),
            )
          ]),
    );
  }
}
