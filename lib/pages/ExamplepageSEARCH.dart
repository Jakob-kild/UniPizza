import 'package:flutter/material.dart';

class search extends StatelessWidget {


  const search({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "Test 2",
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}