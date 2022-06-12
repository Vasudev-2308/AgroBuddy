// ignore_for_file: use_key_in_widget_constructors

import 'package:agro_buddy/Models/crop_recommender_model.dart';
import 'package:agro_buddy/Models/farm_data_model.dart';
import 'package:agro_buddy/Screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>FarmData()),
      ChangeNotifierProvider(create: ((context) => CropRecommender()))
    ],
    child: MyApp()));

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Agrobuddy',
        home: const LoadingScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)));
  }
}
