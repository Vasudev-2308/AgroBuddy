import 'package:flutter/material.dart';

class TempandHumidCard extends StatelessWidget {
  const TempandHumidCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          gradient: const LinearGradient(
            colors: [
              Color(0xff233329),
              Color(0xff63d471),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Farm Data : ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Colors.white), ),
          ), 

          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                  Icon(Icons.thermostat, size: 30, color: Colors.white,),
                  Text("Temperature : ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w200, color: Colors.white),),
                  Text("28℃", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300, color: Colors.white),)
              ],
            ),
          ), 

          const SizedBox(height: 20,),
           Container(
             margin: const EdgeInsets.only(left: 35),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: const [
                  Icon(Icons.opacity, size: 30, color: Colors.white,),
                  Text("Humidity : ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300, color: Colors.white),),
                Text("60 %", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w200, color: Colors.white),)
              ],
          ),
           ), 
          const SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}
