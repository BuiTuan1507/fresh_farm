import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';

class MyProductPage extends StatefulWidget{
  _MyProductPageState createState() => new _MyProductPageState();
  // ghi de 1 doi tuong trang thai private

}

class _MyProductPageState extends State<MyProductPage>{
  List <Item> _ItemList;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  @override
  void initState(){
    super.initState();
    _ItemList = new List();
  }
  void getProduct(){
  }
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("FreshFarm",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
    ),
      body:StreamBuilder<QuerySnapshot>(

      stream: Firestore.instance.collection('shopItems').snapshots(),

      builder: (context,snapshot){
        int count = snapshot.data.documents.length;
        for(int i = 0; i<count;i++){

          int id; String name; String imgPath; bool isLike; int count; int price;
         id = snapshot.data.documents[i]['id'];
          name = snapshot.data.documents[i]['name'];
          imgPath = snapshot.data.documents[i]['imgPath'];
          isLike = snapshot.data.documents[i]['isLike'];
          count = snapshot.data.documents[i]['count'];
          price = snapshot.data.documents[i]['price'];
          Item item  = new Item(id,name,imgPath,price,count,isLike);
          bloc.addItem(item);
          print(item.id);
            print(item.name);
            print(item.imgPath);
            print(item.price);


        }
        //print(snapshot.data.documents[0]);
        if(!snapshot.hasData) return LinearProgressIndicator();

      return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder :(context, index) =>

              _buildListItem(context,snapshot.data.documents[index])
      );


      }
    ));}}
Widget _buildListItem(BuildContext context, DocumentSnapshot document){
  return Row(
    children: <Widget>[
    Container(
        padding: EdgeInsets.only(top: 20,left: 40,right: 20,bottom: 10),
          child: Text(document['name'], style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black
          ),),


      ),
    Text(
      '${document['price']}',style: TextStyle(
      fontSize: 13,color: Colors.blue
    ),
    ),


     Center(
       child: Container(
        padding: EdgeInsets.only(top: 20,right: 20,bottom: 10),
           child: Image.asset(
             document['imgPath'],
             height: 80,
             width: 80,

           )),
     )
      ],
  );
}


