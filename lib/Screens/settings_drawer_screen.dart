import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lottie/lottie.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  _callExpert() async {
    const number = "+917090XXXXXX";

    await FlutterPhoneDirectCaller.callNumber(number);
  }

  bool status0 = false;
  bool status1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          width: MediaQuery.of(context).size.width * 0.75,
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
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () {
                  print("Calling Expert");
                  _callExpert();
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Call an Expert",
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(
                        CupertinoIcons.phone_fill_arrow_right,
                        color: Colors.green[800],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),

              //Lottie.asset('assets/animations/loading_animation.json')
            ]),
          )),
    );
  }
}
