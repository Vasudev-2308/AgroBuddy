import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final String content;
  const FeedCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: null,
        child:  ListTile(
          leading: const Icon(Icons.location_city),
          title: Text(content,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
