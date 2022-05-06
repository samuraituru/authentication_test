import 'package:authentication_test/weight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListModel extends ChangeNotifier {
  List<Body>? bodys;

  Future getBodys() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('bodys').get();

    final List<Body> bodys = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String weight = data['weight'];
      final String fat = data['fat'];
      final String imageURL = data['imageURL'];
      return Body(weight, fat, imageURL);
    }).toList();

    this.bodys = bodys;
    notifyListeners();
  }
}
