import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';

class SearchDetail extends StatefulWidget {
  int id;
  SearchDetail({Key key, this.id}) : super(key: key);
  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  @override
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  @override
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
      body:StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection("shopItems").document(widget.id.toString()).snapshots(),
         builder: (context,snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

            return new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 15, right: 15),
                      height: size.height * 0.35,
                      width: double.infinity,
                      color: Colors.white30,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              color: Colors.white30,
                              height: size.height * 0.25,
                              width: size.width * 0.35,
                              child: Container(
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          snapshot.data['imgPath'])
                                  ),
                                ),
                              ),

                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data['name'], style: TextStyle(fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data['price'].toString(),
                              style: TextStyle(fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black45),
                            ),
                          )
                        ],
                      )


                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 40, right: 15, bottom: 10),
                        child: Icon(
                          Icons.phone, size: 23, color: Color(0xFF0C9869),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'Số điện thoại :', style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                        ),),
                      Container(
                        padding: EdgeInsets.only(right: 20, bottom: 10),
                        child: Text(
                            snapshot.data['count'].toString() , style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 12, bottom: 10,),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 40, right: 15),
                                child: Icon(
                                  Icons.home, size: 23, color:Color(0xFF0C9869) ,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Địa chỉ :', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87
                                ),
                                ),),
                              Container(
                                padding: EdgeInsets.only(right: 0),

                                child: Text(
                                    'NoWhere' , style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 12, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 40, right: 15),
                                child: Icon(
                                  Icons.monetization_on, size: 23, color: Color(0xFF0C9869),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Xu thưởng :', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87
                                ),
                                ),),
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                    '200', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),



                ]);
         }));
  }}




