import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:fresh_farm/App/Products/Detail.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';

class Favorite1 extends StatefulWidget {
  @override
  _Favorite1State createState() => _Favorite1State();
  String uid;
  Favorite1({Key key, this.uid}) : super(key: key);
}

class _Favorite1State extends State<Favorite1> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,cart,child){
      return Scaffold(
        appBar:AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text("Yeu thich",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
        body: StreamBuilder<QuerySnapshot>(
          stream:  Firestore.instance
              .collection('Favorite')
              .where("user",isEqualTo: widget.uid)
              .snapshots(),
          builder: (context, snapshot) {

            return (snapshot.hasData != null)
                ? Column(
              children: <Widget>[

                SingleChildScrollView(
                    child: ListView.builder(


                      shrinkWrap: true,
                      //itemCount: cart.FavoriteItem.length,
                      itemCount: snapshot.data.documents[0]['item'].length,
                      itemBuilder: (BuildContext context, i) {
                        var cartList = snapshot.data.documents[0]['item'];
                         int id = cartList[i]['id'];
                         String name = cartList[i]['name'];
                         String imgPath = cartList[i]['imgPath'];
                         bool isLike = cartList[i]['isLike'];
                         int price = cartList[i]['price'];
                         int count = cartList[i]['count'];
                         int rating = cartList[i]['rating'];
                         Item favoriteItem = new Item(id,name,imgPath,price,count,isLike,rating);
                         cart.FavoriteItem.add(favoriteItem);
                        var favoriteList = cart.FavoriteItem;
                        return new Container(
                          height: 100,
                          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.green[500])
                            ),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    padding:EdgeInsets.only(left: 10,right: 15, top:4, bottom: 4),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(

                                            MaterialPageRoute(builder: (context) => Detail(

                                            )));
                                      },
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(favoriteList[i].imgPath),
                                                  fit: BoxFit.fill))
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Center(
                                              child: Text(favoriteList[i].name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                              )
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding :EdgeInsets.only(bottom: 0),
                                            child: Text('\$${favoriteList[i].price}', style: TextStyle(fontSize: 15, color: Colors.black),
                                            )
                                            ,)
                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 40),
                                  child:  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.delete,color: Colors.green[800],),
                                            onPressed: () {
                                              cart.removeFavorite(favoriteList[i]);
                                              cart.removeItemFavorite(favoriteList[i]);
                                            },
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                )


                              ],
                            ),
                          )
                          ,
                        );



                      },
                    )
                ),
                Center(
                  child: Center(
                    child: RaisedButton(
                      onPressed: (){
                        cart.createFavorite(cart.FavoriteItem, cart.uid);
                      },
                      child: Text('cap nhat danh sach yeu thich'),
                    ),
                  ),
                )

              ],
            )
                : Column(
              children: <Widget>[
                Center(child: Text("Bạn chưa có sản phẩm yêu thích nào",style: TextStyle(fontSize: 24),)),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Xem thêm sản phẩm"),
                  color: Colors.green,
                ),
              ],
            );
          },
        ),
      );
    });

  }
}

