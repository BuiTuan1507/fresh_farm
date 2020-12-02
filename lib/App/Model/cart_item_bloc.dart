import 'dart:async';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerName.dart';
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
  String userID;
  String photoURL;
  String email ;

  User(this.name, this.userID, this.photoURL, this.email);
  User.fromJson(Map<String,dynamic> data)
      :name= data['name'],
        userID = data['userID'],
        email = data['email'],
        photoURL= data['photoURL'];
  User.fromSnapshot(DocumentSnapshot snapshot) :
        name = snapshot['name'],
        userID = snapshot["userID"],
        email = snapshot["email"],
        photoURL = snapshot["photoURL"];

  toJson() {
    return {
      "name": name,
      "userID": userID,

      "email" : email,
      "photoURL": photoURL,


    };
  }

}
class Favorite{
  String key;
  int id;
  String name;
  String imgPath;
  int price;
  int rating;
  int count;
  bool isLike;
  String uid;
  String idFavorite;

  Favorite(this.id, this.name, this.imgPath, this.price, this.count,
      this.isLike, this.rating,this.uid,this.idFavorite);
  Favorite.fromJson(Map<String,dynamic> data)
      :id= data['id'],
        name = data['name'],
        imgPath = data['imgPath'],
        price = data['price'],

        count = data['count'],
        isLike = data['isLike'],
        uid = data['uid'],
        idFavorite = data['idFavorite'],
        rating = data['rating'];

  Favorite.fromSnapshot(DocumentSnapshot snapshot) :
        id = snapshot['id'],
        name = snapshot["name"],
        imgPath = snapshot["imgPath"],
        price = snapshot["price"],
        isLike = snapshot["isLike"],
        count = snapshot["count"],
        uid = snapshot['uid'],
        idFavorite = snapshot['idFavorite'],
        rating = snapshot["rating"];
  toJson() {
    return {
      "id": id,
      "name": name,
      "imgPath": imgPath,
      "price" : price,
      "count": count,
      "isLike":isLike,
      "rating" : rating,
      "uid":uid,
      "idFavorite": idFavorite
    };
  }
}
class ListCart{
  int id;
  String uid;
  String imgPath;
  int price;
  Timestamp createTime;
  Timestamp endTime;
  ListCart(this.id, this.uid, this.imgPath, this.price,this.createTime,this.endTime);
  ListCart.fromJson(Map<String,dynamic> data)
      :id= data['id'],
        uid = data['uid'],
        createTime = data['createTime'],
        endTime = data['endTime'],
        price = data['price'],
        imgPath = data['imgPath'];
  ListCart.fromSnapshot(DocumentSnapshot snapshot) :
        id = snapshot['id'],
        uid = snapshot["uid"],
        createTime = snapshot["createTime"],
        endTime = snapshot["endTime"],
        price = snapshot['price'],
        imgPath = snapshot['imgPath'];

  toJson() {
    return {
      "id": id,
      "uid": uid,
      "createTime" : createTime,
      "endTime": endTime,
      "price": price,
      "imgPath": imgPath
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
  List<Favorite> userFavorite = [];

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


  Favorite createItemFavorite(Item item, String uid){
    String idFavorite = uid + item.id.toString();
    return new Favorite(item.id,item.name,item.imgPath,item.price,item.count,item.isLike,item.rating,uid,idFavorite);
  }
  void addFavorite(Item item,String uid) {
    Favorite favorite = createItemFavorite(item, uid);
    if (userFavorite.length == 0) {
      item.isLike = true;

      userFavorite.add(favorite);

    }else{
      for(int i =0; i<userFavorite.length;i++){
        if (item.id == userFavorite[i].id){
            break;
        }
        else{
          item.isLike = true;
          userFavorite.add(favorite);
        }
      }
    }
    notifyListeners();
  }



  void removeFavorite(Item item, String uid){
    Favorite favorite = createItemFavorite(item, uid);
    userFavorite.remove(favorite);
  }



  void addUser(String userId,String name, String photoURL, String email){
    uid = userId;
    name = name;
    photoURL = photoURL;
    email = email;
  }
  void createCart(List<Item> item,String uid,String address,int totalPrice,int id, int time){
    List yourItemList = [];
    int t = 1;
    if (time == 1){
      t = 1;
    }else{
      t = 2;
    }
    var timeNow = DateTime.now();
    var endTime = timeNow.add(new Duration(hours : t));
    for (int i = 0 ; i<item.length;i++){
      yourItemList.add({
        "id":item[i].id,
        "name": item[i].name,
        "price":item[i].price,
        "imgPath": item[i].imgPath,
       "count" : item[i].count
      });
    }
    Firestore firestoreInstance = Firestore.instance;

    firestoreInstance.collection('cart').document().setData({
      "id" : id,
      "user":uid,
      'item':FieldValue.arrayUnion(yourItemList),
      "createTime" : Timestamp.fromDate(timeNow),
      "endTime" : Timestamp.fromDate(endTime),
      "address": address,
      "price" : totalPrice
    });
  }
  void addListCart(int id, String uid, int price, String imgPath){
    Firestore _firestore = Firestore.instance;
    var timeNow = DateTime.now();
    var endTime = timeNow.add(new Duration(hours : 1));
    _firestore.collection('ListCart').document().setData({
      "id" : id,
      "uid" : uid,
      "createTime" : Timestamp.fromDate(timeNow),
      "endTime" : Timestamp.fromDate(endTime),
      "price" : price,
      "imgPath" : imgPath
    });
  }
  void createReview(int id, String uid, int rating, String text,String name, String photoURL){
    Firestore firestoreReview = Firestore.instance;

    firestoreReview.collection('Rating').document().setData({
      "id":id,
      "uid":uid,
      "rating":rating,
      "text":text,
      "name":name,
      "photoURL": photoURL
    });

  }

  void createFavorite(List<Favorite> item){
    Firestore firestoreInstance = Firestore.instance;
    for (int i = 0 ; i<item.length;i++){
      firestoreInstance.collection('Favorite').document().setData({
        "uid":uid,
        "id":item[i].id,
        "name":item[i].name,
        "imgPath":item[i].imgPath,
        "count":item[i].count,
        "price":item[i].price,
        "rating":item[i].rating,
        "isLike":item[i].isLike,
        "idFavorite": uid + item[i].id.toString()
      });
    }



  }



  CollectionReference users = Firestore.instance.collection('Rating');

  Future<void> deleteReview(int id,String uid) {
    var query =  users
        .where("id", isEqualTo: id).where("uid",isEqualTo: uid);
    query.getDocuments().then((querySnapshot) => {
      querySnapshot.documents.forEach((element) {
        element.reference.delete();
      })
    });
  }
  CollectionReference usaa = Firestore.instance.collection('Favorite');

  Future<void> deleteFavorite(String idFavorite) {

    return usaa
        .document(idFavorite)
        .delete()
        .then((value) => print("Favorite delete"))
        .catchError((error) => print("Failed to update favorite: $error"));
  }
  void createItemFavorite1 (Item item,String uid){
    Firestore firestoreReview = Firestore.instance;

    String idFavorite = uid+ item.id.toString();
    firestoreReview.collection('Favorite').document(idFavorite).setData({
      "uid":uid,
      "id":item.id,
      "name":item.name,
      "imgPath":item.imgPath,
      "count":item.count,
      "price":item.price,
      "rating":item.rating,
      "isLike":item.isLike,
      "idFavorite": uid + item.id.toString()
    });
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