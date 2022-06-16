import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../classes/Pizzaria.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map> pizzarias = [
    {"Navn": "Pizzaria Luca","Rating":"4.2/5"},
    {"Navn": "Geppetto's Pizza Lyngby","Rating":"3.7/5"},
    {"Navn": "Kongens Pizza Lyngby","Rating":"3.5/5"}
  ];

    // Map data = {};

    @override
    Widget build(BuildContext context) {

      /*
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background image
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    */

    Stream<List<Pizzaria>> readPizzarias() => FirebaseFirestore.instance
        .collection('pizzarias')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Pizzaria.fromJson(doc.data())).toString());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: pizzarias.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: InkWell(
                  splashColor: Colors.red.withAlpha(30),
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: {
                      "name" : pizzarias[index].values.elementAt(0),
                      "rating": pizzarias[index].values.elementAt(1),
                    });
                  },
                  child: Container(

                    width: 300,
                    height: 100,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black
                            ),
                            children: <TextSpan>[

                              TextSpan(text: pizzarias[index].values.elementAt(0) + "\n" + "\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.red[900])),

                              TextSpan(text: pizzarias[index].values.elementAt(1),)
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}