import 'dart:async';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'service.dart';

import 'package:provider/provider.dart';
class Item{
  String key;
  int id;
  String name;
  String imgPath;
  int price;
  int rating;
  int count;
  bool isLike;


  Item(this.id, this.name, this.imgPath, this.price, this.count,
      this.isLike, this.rating);
  Item.fromJson(Map<String,dynamic> data)
      :id= data['id'],
  name = data['name'],
  imgPath = data['imgPath'],
  price = data['price'],

  count = data['count'],
  isLike = data['isLike'],
  rating = data['rating'];

  Item.fromSnapshot(DocumentSnapshot snapshot) :
        id = snapshot['id'],
        name = snapshot["name"],
        imgPath = snapshot["imgPath"],
        price = snapshot["price"],
        isLike = snapshot["isLike"],
        count = snapshot["count"],
          rating = snapshot["rating"];
  toJson() {
    return {
      "id": id,
      "name": name,
      "imgPath": imgPath,
      "price" : price,
      "count": count,
      "isLike":isLike,
      "rating" : rating
    };
  }

}
class Rating{
  int id;
  String uid;
  String text;
  int rating;
  String name;
  String photoURL;

  Rating(this.id, this.uid, this.text,this.rating, this.photoURL,this.name);
  Rating.fromJson(Map<String,dynamic> data)
      :id= data['id'],
        uid = data['uid'],
        text = data['text'],
        rating= data['rating']   ,
        name = data['name'],
        photoURL = data['photoURL'];
  Rating.fromSnapshot(DocumentSnapshot snapshot) :
        id = snapshot['id'],
        uid = snapshot["name"],
        rating = snapshot["rating"],
        text = snapshot["text"],
        name = snapshot['name'],
        photoURL = snapshot['photoURL'];

  toJson() {
    return {
      "id": id,
      "uid": uid,

      "text" : text,
      "rating": rating,
      'name':name,
      'photoURL':photoURL


    };
  }
}
class User{
  String name;
  String uid;
  String photoURL;
  String email ;

  User(this.name, this.uid, this.photoURL, this.email);
  User.fromJson(Map<String,dynamic> data)
      :name= data['name'],
        uid = data['uid'],
        email = data['email'],
        photoURL= data['photoURL'];
  User.fromSnapshot(DocumentSnapshot snapshot) :
        name = snapshot['name'],
        uid = snapshot["uid"],
        email = snapshot["email"],
        photoURL = snapshot["photoURL"];

  toJson() {
    return {
      "name": name,
      "uid": uid,

      "email" : email,
      "photoURL": photoURL,


    };
  }

}
class Favorite{

  List<Item> item;
  String uid;


  Favorite(this.item, this.uid);
  Favorite.fromJson(Map<String,dynamic> data)
      :item= data['item'],
        uid = data['uid'];

  Favorite.fromSnapshot(DocumentSnapshot snapshot) :
        item = snapshot['item'],
        uid = snapshot["uid"];

  toJson() {
    return {
      "item": item,
      "uid": uid,

    };
  }

}


class Cart extends ChangeNotifier{
  List<Rating> RatingReview = [];
  List <Item> ListItem = [];
  String uid;
  String name;
  String photoURL;
  String email;
  int idRating;
  int total = 0;
  int delivery;
  int subTotal;
  List <Item> FavoriteItem = [];
  List<Item> infoItem = [];
  Item searchItem;
  Item detailItem;
  User currentUser;

  void add(Item item) {
    ListItem.add(item);
    total= total + item.price*item.count;
    notifyListeners();
  }

  void remove(Item item) {
    total = total- item.price*item.count;
    ListItem.remove(item);
    notifyListeners();
  }
  int totalPrice(List<Item> item){
    int n = 0;
    for(int i = 0; i<item.length;i++){
      n = n+ item[i].price*item[i].count;
    }
    return n;
  }



  void addFavorite(Item item) {
    if (FavoriteItem.length == 0) {
      item.isLike = true;
      FavoriteItem.add(item);

    }else{
      for(int i =0; i<FavoriteItem.length;i++){
        if (item.id == FavoriteItem[i].id){

        }
        else{
          item.isLike = true;
          FavoriteItem.add(item);
        }
      }
    }
    notifyListeners();
  }

  void removeFavorite(Item item) {
    item.isLike = false;
    for(int i = 0 ;i<FavoriteItem.length;i++){
      if (item.id == FavoriteItem[i].id){
        FavoriteItem.remove(item);
      }
    }

    notifyListeners();
  }
  void addUser(String userId,String name, String photoURL, String email){
    uid = userId;
    name = name;
    photoURL = photoURL;
    email = email;
  }
  void createCart(List<Item> item,String uid){
    List yourItemList = [];
    for (int i = 0 ; i<item.length;i++){
      yourItemList.add({
        "id":item[i].id,
        "name": item[i].name,
        "price":item[i].price
      });
    }
    Firestore firestoreInstance = Firestore.instance;

    firestoreInstance.collection('cart').document(uid).setData({
      "user":uid,
      'item':FieldValue.arrayUnion(yourItemList)

    });
  }
  void createReview(int id, String uid, int rating, String text,String name, String photoURL){
    Firestore firestoreReview = Firestore.instance;

    firestoreReview.collection('Rating').document(id.toString()).setData({
      "id":id,
      "uid":uid,
      "rating":rating,
      "text":text,
      "name":name,
      "photoURL": photoURL
    });

  }

  void createFavorite(List<Item> item,String uid){
    List yourItemList = [];
    for (int i = 0 ; i<item.length;i++){
      yourItemList.add({
        "id":item[i].id,
        "name": item[i].name,
        "price":item[i].price,
        "imgPath": item[i].imgPath,
        "rating":item[i].rating,
        "isLike": true,
        "count":1
      });
    }
    Firestore firestoreInstance = Firestore.instance;

    firestoreInstance.collection('Favorite').document(uid).setData({
      "user":uid,
      'item':FieldValue.arrayUnion(yourItemList)

    });
  }
  void removeItemFavorite(Item item){
    Firestore firestoreInstance = Firestore.instance;
    FavoriteItem.remove(item);
    firestoreInstance.collection("Favorite").document(uid).updateData({
      "user": uid,
      "item": FieldValue.arrayUnion(FavoriteItem)
    });
  }


  CollectionReference users = Firestore.instance.collection('Rating');

  Future<void> deleteReview(int id) {
    return users
        .document('2')
        .delete()
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  void addInfoItem(item){
    infoItem.add(item);
    detailItem = item;
  }
  void removeInfoItem(item){
    infoItem.remove(item);
  }
  void getSearch(String id){
    final firestoreInstance = Firestore.instance;
    firestoreInstance.collection("User").document(id);

  }
  int getIdRating(Item item){
    idRating = item.id;
    return idRating;
  }

}



class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;
  final Map allItems = {
    'shop items': [
      {'name': 'Hoa qua', 'price': 20, 'id': 1,'imgPath':'assets/1.jpg','count':1,'isLike':false},
      {'name': 'Thit heo', 'price': 100, 'id': 2,'imgPath':'assets/4.jpg','count':1,'isLike':false},
      {'name': 'Rau cu', 'price': 10, 'id': 3,'imgPath':'assets/2.jpg','count':1,'isLike':false,},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 5,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 6,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 7,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 8,'imgPath':'assets/3.jpg','count':1,'isLike':false},
    ],
    'cart items': [],
    'favorite items':[],
    'info item': [],
    'total':0,
    'delivery':0,
    'subTotal': 0
  };



  void addToInfo(item) {
    allItems['info item'].add(item);
  }
  void removeToInfo(item){
    allItems['info item'].remove(item);
  }

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    allItems['total'] = allItems['total']+item['count']*item['price'];
    allItems['delivery'] = allItems['total']* 0.05;
    allItems['subTotal'] = allItems['total'] + allItems['delivery'];
    cartStreamController.sink.add(allItems);

  }
  Firestore dataProduct = Firestore.instance;

  Stream<List<Item>> getItemList =Firestore.instance.collection('shopItems')
      .snapshots()
      .map((snapShot) => snapShot.documents
      .map((document) => Item.fromJson(document.data))
      .toList());


  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    allItems['total'] = allItems['total']-item['count']*item['price'];
    allItems['delivery'] = allItems['total']* 0.05;
    allItems['subTotal'] = allItems['total'] + allItems['delivery'];
    cartStreamController.sink.add(allItems);
  }
  void addToFavorite(item) {
    allItems['favorite items'].add(item);
    item['isLike']= true;
    cartStreamController.sink.add(allItems);

  }



  void removeFromFavorite(item) {
    allItems['favorite items'].remove(item);
    item['isLike'] = false;
    cartStreamController.sink.add(allItems);
  }




  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();