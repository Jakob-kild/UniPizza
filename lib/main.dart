import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uni_pizzas/pages/choose_location.dart';
import 'package:uni_pizzas/pages/detail_pizzaria.dart';
import 'package:uni_pizzas/pages/homeScreen.dart';
import 'package:uni_pizzas/pages/restaurant_details.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/home': (context) => RestaurantDetailsScreen(),
        '/location': (context) => ChooseLocation(),
        '/detail': (context) => DetailPizza(),
      }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Firebase"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => FirebaseFirestore.instance
          .collection("testing")
          .add({"timestamp": Timestamp.fromDate(DateTime.now())}),
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("testing").snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) return const SizedBox.shrink();

              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final docData = snapshot.data.docs[index];
                  final comment = (docData['comment'] as String);

                  return ListTile(
                    title: Text(comment),
                  );
                },
              );
            },
          ),
        ),
    ),
    );
  }
}

