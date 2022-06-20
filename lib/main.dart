import 'package:uni_pizzas/pages/maps.dart';
import 'classes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uni_pizzas/pages/homeScreen.dart';
import 'package:uni_pizzas/pages/restaurant_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(theme: theme(), initialRoute: '/', routes: {
    '/': (context) => HomeScreen(),
    '/home': (context) => RestaurantDetailsScreen(),
    '/map' : (context) => MapScreen(),
  },));
}
