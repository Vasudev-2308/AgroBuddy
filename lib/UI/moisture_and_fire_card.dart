import 'package:flutter/material.dart';

class MoistureandFireCard extends StatelessWidget {
  const MoistureandFireCard({Key? key}) : super(key: key);

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
              Color(0xff00c3ff),
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
                  Icon(Icons.water_drop, size: 30, color: Colors.white,),
                  Text("Moisture : ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w200, color: Colors.white),),
                  Text("Present", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300, color: Colors.white),)
              ],
            ),
          ), 

          const SizedBox(height: 20,),
           Container(
             margin: const EdgeInsets.only(left: 35),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: const [
                  Icon(Icons.whatshot, size: 30, color: Colors.white,),
                  Text("Fire : ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300, color: Colors.white),),
                Text("False", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w200, color: Colors.white),)
              ],
          ),
           ), 
          const SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}
