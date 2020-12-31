import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_farm/App/Cart/TabBarCart.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';
import 'package:fresh_farm/App/Products/Category.dart';
import 'productRecommed.dart';
import 'package:provider/provider.dart';

class SearchDetail extends StatefulWidget {
  int id;
  SearchDetail({Key key, this.id}) : super(key: key);
  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;
    return  Consumer<Cart>(
        builder: (context,cart,child) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0C9869),
        title: Text("Thông tin chi tiết",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    ),
      body:StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("shopItems").where('id',isEqualTo: widget.id).snapshots(),
         builder: (context,snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          else{
            int id = snapshot.data.documents[0]['id'];
            String name = snapshot.data.documents[0]['name'];
            String imgPath = snapshot.data.documents[0]['imgPath'];
            bool isLike = snapshot.data.documents[0]['isLike'];
            int price = snapshot.data.documents[0]['price'];
            int count = snapshot.data.documents[0]['count'];
            int rating = snapshot.data.documents[0]['rating'];
            Item searchItem = new Item(id,name,imgPath,price,count,isLike,rating);

            return new SingleChildScrollView(
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                          "${searchItem.name}",style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0C9869),
                      )),
                    ),
                    SizedBox(height: 15,),
                    Hero(
                      tag: snapshot.data.documents[0]['imgPath'],
                      child: Image.asset(snapshot.data.documents[0]['imgPath'],
                        height: size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.contain,),

                    ),

                    Center(
                      child: Text('\đ${snapshot.data.documents[0]['price']}',style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C9869)   )),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Text(snapshot.data.documents[0]['name'],
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 24.0)),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50.0,
                        child: Text('Sản phẩm được kiểm tra kĩ càng theo quy trình VietGap, tươi mới mỗi ngày',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 16.0,
                                color: Color(0xFFB4B8B9))
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width - 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Color(0xFF0C9869)
                            ),
                            child: Center(
                                child: InkWell(
                                    onTap: (){
                                      cart.add(searchItem);
                                      Navigator.of(context).push(

                                          MaterialPageRoute(builder: (context) => TabBarCart()));
                                    },
                                    child: Text('Thêm vào giỏ hàng',
                                      style: TextStyle(
                                          fontFamily: 'Varela',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    )
                                )

                            )
                        )
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(

                            MaterialPageRoute(builder: (context) => MyCategoryPage()));

                      },
                      child: Text("Xem thêm sản phẩm"),
                      color: Colors.green,
                    ),
                    SizedBox(height: 40)
                  ],
                )



            );
         }}));});
  }}




