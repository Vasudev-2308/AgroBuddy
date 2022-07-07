import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], 
          borderRadius: BorderRadius.circular(30)
        ),
        height: MediaQuery.of(context).size.height*0.4,
        child: Lottie.asset('assets/animations/loading_animation.json'),
      ),
    );
  }
}
