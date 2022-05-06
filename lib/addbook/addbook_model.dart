import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String? weight;
  String? fat;
  String? imageURL;

  Future addBook() async {
    if (weight == null || weight == "") {
      throw 'タイトルが入力されていません';
    }

    if (fat == null || fat!.isEmpty) {
      throw '著者が入力されていません';
    }

    if (imageURL == null || imageURL!.isEmpty) {
      throw 'URLが入力されていません';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('bodys').add({
      'weight': weight,
      'fat': fat,
      'imageURL': imageURL,
    });
  }
}
