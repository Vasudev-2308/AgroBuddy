import 'package:agro_buddy/Screens/homescreen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 30),
            child: Center(
                child: Image(
              image: AssetImage("assets/images/logo.png"),
            )),
          ),
          const Padding(
            padding:  EdgeInsets.only(left: 8, top: 30.0),
            child: Text(
              "Agro Buddy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 39),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(left: 8, top: 10.0, bottom: 20),
            child:  Text(
              "A farming tool that every farmer needs",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
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
            ),
          ), 
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Text(
              "Made with ❤️by Team Agrobuddy",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
