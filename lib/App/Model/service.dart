import 'dart:async';
import 'Message.dart';
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

  Stream<List<Rating>> getRatingList =  Firestore.instance.collection('Rating')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => Rating.fromJson(document.data))
      .toList());
  Stream<List<User>> getUserList =  Firestore.instance.collection('User')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => User.fromJson(document.data))
      .toList());
  Stream<List<Favorite>> getFavorite =  Firestore.instance.collection('Favorite')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => Favorite.fromJson(document.data))
      .toList());
  Stream<List<ListCart>> getListCart =  Firestore.instance.collection('ListCart')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => ListCart.fromJson(document.data))
      .toList());
  Stream<List<Message>> getListMessage =  Firestore.instance.collection('Chat')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => Message.fromJson(document.data))
      .toList());



  void dispose() {
    productStreamController.close(); // close our StreamController
  }

}


final blocProduct = FirebaseService();