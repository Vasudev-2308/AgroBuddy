// ignore_for_file: use_key_in_widget_constructors

import 'package:agro_buddy/Models/crop_recommender_model.dart';
import 'package:agro_buddy/Models/farm_data_model.dart';
import 'package:agro_buddy/Screens/HeroScreens/crop_hero.dart';
import 'package:agro_buddy/Screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Models/toggle_model.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const initAndroidSettings = AndroidInitializationSettings('logo');
  var initIoSSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {});

  var initializeSettings = InitializationSettings(
      android: initAndroidSettings, iOS: initIoSSettings);

  await flutterLocalNotificationsPlugin.initialize(
    initializeSettings,
    onSelectNotification: (payload) async {
      debugPrint(payload);
    },
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FarmData()),
    ChangeNotifierProvider(create: ((context) => CropRecommender())),
    ChangeNotifierProvider(create: (context) => DrawerStateProvider(),)
  ], child: MyApp()));
}

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
