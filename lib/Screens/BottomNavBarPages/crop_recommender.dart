// ignore_for_file: non_constant_identifier_names

import 'package:agro_buddy/UI/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/crop_recommender_model.dart';

// ignore: must_be_immutable
class RecommenderScreen extends StatefulWidget {
  RecommenderScreen({Key? key}) : super(key: key);

  @override
  State<RecommenderScreen> createState() => _RecommenderScreenState();
}

class _RecommenderScreenState extends State<RecommenderScreen> {
  final formKey = GlobalKey<FormState>();
  double? n;
  double? p;
  double? k;
  double? temp;
  double? hum;
  double? ph;
  double? rf;

  late TextEditingController nC;
  late TextEditingController pC;
  late TextEditingController kC;
  late TextEditingController tC;
  late TextEditingController hC;
  late TextEditingController phC;
  late TextEditingController rfC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nC = TextEditingController();
    pC = TextEditingController();
    kC = TextEditingController();
    tC = TextEditingController();
    hC = TextEditingController();
    phC = TextEditingController();
    rfC = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var cropRecommenderInstance = Provider.of<CropRecommender>(context);
    String? cropName = cropRecommenderInstance.cropName;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Form(
        key: formKey,
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
              cropName!.isEmpty
                  ? const SizedBox(
                      width: 90, height: 90, child: LoadingWidget())
                  : Text(
                      cropName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 38),
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
                          "Nitrogen %",
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
                              controller: nC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cant be Empty';
                                } else if (value.isNotEmpty &&
                                    double.parse(value) > 100) {
                                  return 'Invalid Value';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  n = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.done,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "0-100",
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
                          "Phosphorus %",
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
                              controller: pC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cant be Empty';
                                } else if (value.isNotEmpty &&
                                    double.parse(value) > 100) {
                                  return 'Invalid Value';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  p = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "0-100",
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
                          "Potassium %",
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
                              controller: kC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cant be Empty';
                                }
                                if (value.isNotEmpty &&
                                    double.parse(value) > 100) {
                                  return 'Invalid Value';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  k = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "0-100",
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
                              controller: tC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cant be Empty';
                                }
                                if (value.isNotEmpty &&
                                    double.parse(value) >= 100) {
                                  return 'Invalid Value';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  temp = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "0-100℃",
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
                              controller: hC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cant be Empty';
                                }
                                if (value.isNotEmpty &&
                                    double.parse(value) > 100) {
                                  return 'Invalid Value';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  hum = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "0-100",
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
                              controller: phC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cant be Empty';
                                }
                                if (value.isNotEmpty &&
                                    double.parse(value) < 0 &&
                                    double.parse(value) > 14) {
                                  return 'Invalid Value';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  ph = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "0-14",
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
                              controller: rfC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Cant be Empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  rf = double.parse(value);
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
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
                      final validState = formKey.currentState?.validate();

                      if (validState!) {
                        setState(() {
                          nC.clear();
                          pC.clear();
                          kC.clear();
                          tC.clear();
                          hC.clear();
                          phC.clear();
                          rfC.clear();
                        });
                        Fluttertoast.showToast(
                            msg: "Please wait while we get best crop",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 20.0);

                        cropRecommenderInstance.fillValues(
                            n!, p!, k!, temp!, hum!, ph!, rf!);

                        cropRecommenderInstance.setCropName();
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please Enter Valid Values",
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      }
                    },
                    label: const Text("Submit")),
              )
            ]),
      ),
    );
  }
}
