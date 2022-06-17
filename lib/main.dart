import 'package:flutter/material.dart';
import 'package:world_time_app/pages/detail_pizzaria.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/homeScreen.dart';
import 'package:world_time_app/pages/restaurant_details.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'classes/theme.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/home': (context) => RestaurantDetailsScreen(),
      '/location': (context) => ChooseLocation(),
      '/detail': (context) => DetailPizza(),
    },theme: theme(),
));
