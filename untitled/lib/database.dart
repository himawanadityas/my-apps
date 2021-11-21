import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("data");

class Database {
  static String? uuid;

  static Future<void> addItem({
    required String title,
    required String description
  }) async{
    DocumentReference documentReference = _collectionReference.doc(uuid).collection("items").doc();
    Map<String, dynamic> data = <String, dynamic>{
      "title":title,
      "description":description
    };
    await documentReference.set(data).whenComplete(() => print("Data was completed...")).catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems(){
    CollectionReference colreff = _collectionReference.doc(uuid).collection('items');

    return colreff.snapshots();
  }
}