import 'package:agro_buddy/Screens/HeroScreens/crop_hero.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final String content;
  const FeedCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HeroScreen(content: content)));
        },
        child: ListTile(
          leading: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/plantIcon.png'))),
          ),
          title: Text(
            content,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
