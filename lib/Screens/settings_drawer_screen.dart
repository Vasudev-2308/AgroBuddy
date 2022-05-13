//

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
   bool status0 = false;
  bool status1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          ),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: ListView(children: <Widget>[
              const Center(
                child: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const Divider(
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Push Notifications"),
                  FlutterSwitch(
                    width: 70.0,
                    height: 34.0,
                    valueFontSize: 15.0,
                    toggleSize: 22.0,
                    value: status0,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status0 = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("App Updates"),
                  FlutterSwitch(
                    width: 70.0,
                    height: 34.0,
                    valueFontSize: 15.0,
                    toggleSize: 22.0,
                    value: status1,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ],
              ),

              Lottie.network("https://assets7.lottiefiles.com/packages/lf20_poqmycwy.json")
            ]),
          )),
    );
  }
}
