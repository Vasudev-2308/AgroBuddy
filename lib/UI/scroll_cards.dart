import 'package:agro_buddy/UI/moisture_and_fire_card.dart';
import 'package:agro_buddy/UI/temp_and_humid_card.dart';
import 'package:flutter/material.dart';

class ScrollCards extends StatelessWidget {
  const ScrollCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          TempandHumidCard(),
          MoistureandFireCard(),
        ],
      ),
    );
  }
}
