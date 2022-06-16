import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Map> pizzarias = [
    {"Navn": "Pizzaria Luca","Rating":"4.2/5"},
    {"Navn": "Geppetto's Pizza Lyngby","Rating":"3.7/5"},
    {"Navn": "Kongens Pizza Lyngby","Rating":"3.5/5"}
  ];

  /*
  void updateTime(index) async {
    WorldTime instance = pizzarias[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
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
                                    color: Colors.red)),

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