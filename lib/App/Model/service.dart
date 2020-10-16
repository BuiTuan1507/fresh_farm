

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_item_bloc.dart';

class FirebaseService{
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream;
  Firestore dataProduct = Firestore.instance;

  Stream<List<Item>> getItemList =  Firestore.instance.collection('shopItems')
        .snapshots()
        .map((snapShot) => snapShot.documents
        .map((document) => Item.fromJson(document.data))
        .toList());




  void dispose() {
    productStreamController.close(); // close our StreamController
  }

}
class Firebase123 {
  Stream<List<Rating>> getRatingList =  Firestore.instance.collection('Rating')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => Rating.fromJson(document.data))
      .toList());
}

final blocProduct = FirebaseService();