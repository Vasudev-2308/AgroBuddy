import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeroScreen extends StatelessWidget {
  final String content;
  const HeroScreen({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    launchQuery(String name) async {
      String baseUrl = "https://www.google.com/search?q=how+to+grow+";
      await launchUrlString(
        baseUrl + name.toLowerCase(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        elevation: 0,
        title: const Text(
          'Agrobuddy',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: Colors.green.shade200,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child:  Text(
                "If you want to learn how to grow your crop $content ",
                style: const TextStyle(
                  fontSize: 18,
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: (() => launchQuery(content)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.green),
              child: const Center(
                child: Text(
                  "How to grow",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
