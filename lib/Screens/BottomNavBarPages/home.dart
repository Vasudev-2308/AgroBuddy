// ignore_for_file: prefer_const_constructors

import 'package:agro_buddy/UI/feed_cards.dart';
import 'package:agro_buddy/UI/temp_and_humid_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TempandHumidCard(),
          Container(
              margin: EdgeInsets.only(left: 30, right: 20),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Divider(
                height: 20,
                thickness: 3,
              )),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Farm Updates",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 33),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: ((context, index) {
            return FeedCard(
              content: "Intrusion Detected",
            );
          }))
        ],
      ),
    );
  }
}
