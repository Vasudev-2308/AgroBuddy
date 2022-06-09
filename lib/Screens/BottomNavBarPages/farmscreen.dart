// ignore_for_file: prefer_const_constructors
import 'package:agro_buddy/Models/farm_data_model.dart';
import 'package:agro_buddy/UI/loading.dart';
import 'package:agro_buddy/UI/scroll_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Farm extends StatefulWidget {
  const Farm({Key? key}) : super(key: key);

  @override
  State<Farm> createState() => _FarmState();
}

class _FarmState extends State<Farm> {
  //final String streamUrl = "http://192.168.0.105:8081/";
  VlcPlayerController controller = VlcPlayerController.network(
    "http://192.168.0.105:8081/",
    hwAcc: HwAcc.full,
    autoPlay: true,
  );
  bool videoStatus = true;

  streamVideo() {
    if (!videoStatus) {
      setState(() {
        videoStatus = true;
      });

      controller.play();
    } else {
      setState(() {
        videoStatus = true;
      });
      controller.play();
    }
  }

  stopVideo() {
    if (videoStatus) {
      setState(() {
        videoStatus = false;
      });
      controller.pause();
    } else {
      setState(() {
        videoStatus = false;
      });
      controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    var providerInstance = Provider.of<FarmData>(context);
    providerInstance.fetchDataFromJson();
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: videoStatus == true
                      ? VlcPlayer(
                          aspectRatio: MediaQuery.of(context).size.width *
                              0.95 /
                              MediaQuery.of(context).size.height *
                              0.4,
                          controller: controller,
                          placeholder: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : LoadingWidget(),
                )
                // Placeholder(
                //   child: SizedBox(
                //
                //   ),
                // ),
                ),
            Center(
              child: Text(
                "Controller",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                streamVideo();
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
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Toast.show("Turning Camera Off...",
                    duration: Toast.lengthLong, gravity: Toast.center);

                stopVideo();
              },
              child: Card(
                elevation: 5,
                child: ListTile(
                  tileColor: Colors.red,
                  title: Center(
                      child: Text("Turn off Camera",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Made with ❤️by Team Agrobuddy",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            )
          ]),
    );
  }
}
