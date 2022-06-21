import 'package:uni_pizzas/pages/maps.dart';
import 'classes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uni_pizzas/pages/homeScreen.dart';
import 'package:uni_pizzas/pages/restaurant_details.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: theme(),
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/home': (context) => PizzariaDetailsScreen(),
      '/map': (context) => MapScreen(),
    },
  ));
}
