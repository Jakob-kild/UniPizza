import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  //collection reference
  final CollectionReference pizzariaCollection =  Firestore.instance.collection('Pizzarias');


}