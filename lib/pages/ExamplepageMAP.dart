import 'package:flutter/material.dart';

class map extends StatelessWidget {

  const map({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Test 1",
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
