import 'package:agro_buddy/Models/farm_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoistureandFireCard extends StatelessWidget {
  const MoistureandFireCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerInstance = Provider.of<FarmData>(context);
    providerInstance.fetchDataFromJson();

    bool moistStat = providerInstance.moistureStatus;
    bool fireStat = providerInstance.fireStatus;

    String moistStat1 = "Present";
    String moistStat2 = "Absent";
    String fireStat1 = "Safe";
    String fireStat2 = "Unsafe";
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color(0xff00c3ff),
            Color(0xff63d471),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Farm Data : ",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.water_drop,
                  size: 30,
                  color: Colors.white,
                ),
                const Text(
                  "Moisture : ",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
                Text(
                  moistStat ? moistStat1: moistStat2,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.whatshot,
                  size: 30,
                  color: Colors.white,
                ),
                const Text(
                  "Fire : ",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                Text(
                  fireStat ? fireStat2: fireStat1,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
