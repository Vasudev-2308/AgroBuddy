import 'package:agro_buddy/Screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Center(
                child: Image(
              image: AssetImage("assets/images/logo.png"),
            )),
          ),
          const Text(
            "Agro Buddy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 39),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 65,
            child: FloatingActionButton.extended(
              elevation: 5,
              backgroundColor: Colors.green,
              label: const Text(
                "Continue",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const HomeScreen())));
              },
            ),
          )
        ],
      ),
    );
  }
}
