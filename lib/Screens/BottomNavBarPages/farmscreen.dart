// ignore_for_file: prefer_const_constructors
import 'package:agro_buddy/UI/scroll_cards.dart';
import 'package:agro_buddy/UI/temp_and_humid_card.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Farm extends StatelessWidget {
  const Farm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Control your Farm",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            )),
            Container(
                margin: EdgeInsets.only(left: 30, right: 20),
                width: MediaQuery.of(context).size.width * 0.85,
                child: Divider(
                  height: 10,
                  thickness: 3,
                )),
            SizedBox(
              height: 20,
            ),
            ScrollCards(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Camera",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Placeholder(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
            ),
            Center(
              child: Text(
                "Controller",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                Toast.show("Turning Camera On...",
                    duration: Toast.lengthLong, gravity: Toast.center);
              },
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.green,
                  title: Center(
                      child: Text(
                    "Turn on Camera",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Toast.show("Turning Camera Off...",
                    duration: Toast.lengthLong, gravity: Toast.center);
              },
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.red,
                  title: Center(
                      child: Text("Turn off Camera",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                ),
              ),
            ),
          ]),
    );
  }
}
