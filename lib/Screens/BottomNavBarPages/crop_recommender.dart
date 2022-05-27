// ignore_for_file: non_constant_identifier_names

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../Models/crop_recommender_model.dart';

// ignore: must_be_immutable
class RecommenderScreen extends StatelessWidget {
  RecommenderScreen({Key? key}) : super(key: key);

  TextEditingController n_Val = TextEditingController();
  TextEditingController p_Val = TextEditingController();
  TextEditingController k_Val = TextEditingController();
  TextEditingController temp_Val = TextEditingController();
  TextEditingController humid_Val = TextEditingController();
  TextEditingController ph_Val = TextEditingController();
  TextEditingController rf_val = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cropRecommenderInstance = Provider.of<CropRecommender>(context);
    String? cropName = cropRecommenderInstance.cropName;
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
            Text(
              cropName!.isEmpty?"Crop":cropName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: [
                      const Text(
                        "Nitrogen",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: n_Val,
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.done,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "N",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: [
                      const Text(
                        "Phosphorus",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: p_Val,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "P",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: [
                      const Text(
                        "Potassium",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: k_Val,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "K",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      const Text(
                        "Temperature ℃",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: temp_Val,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Temp",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      const Text(
                        "Humidity %",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: humid_Val,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Humid",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      const Text(
                        "PH Value",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: ph_Val,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "PH",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      const Text(
                        "Rainfall",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            controller: rf_val,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "rainfall (mm)",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    double n = double.parse(n_Val.text);
                    double p = double.parse(p_Val.text);
                    double k = double.parse(k_Val.text);
                    double temp = double.parse(temp_Val.text);
                    double hum = double.parse(humid_Val.text);
                    double ph = double.parse(ph_Val.text);
                    double rf = double.parse(rf_val.text);

                    cropRecommenderInstance.fillValues(
                        n, p, k, temp, hum, ph, rf);

                    cropRecommenderInstance.setCropName();
                  },
                  label: const Text("Submit")),
            )
          ]),
    );
  }
}
