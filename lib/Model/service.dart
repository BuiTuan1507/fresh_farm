

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';

class FirebaseService{
  Firestore dataProduct = Firestore.instance;

  Stream<List<Item>> getItemList =Firestore.instance.collection('shopItems')
        .snapshots()
        .map((snapShot) => snapShot.documents
        .map((document) => Item.fromJson(document.data))
        .toList());

}