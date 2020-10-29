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
    List<Favorite> userList1 = Provider.of<List<Favorite>>(context);

    return Consumer<Cart>(builder: (context,cart,child){
      print(userList1[0].idFavorite);
      List userFavorite = [];
      if (userList1!=null){
      for (int i=0;i<userList1.length;i++){
        if(userList1[i].uid == '0oULJrkVt3bTsqetIYgTY75ucP03'){
          userFavorite.add(userList1[i]);
          }
        }
      }
      return Scaffold(
        appBar:AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text("Yeu thich",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
        body:(userFavorite.length != 0)
                ?
              SingleChildScrollView(
                   child: Column(
                      children: <Widget>[
                        ListView.builder(


                      shrinkWrap: true,
                      //itemCount: cart.FavoriteItem.length,
                      itemCount: userFavorite.length,
                      itemBuilder: (BuildContext context, i) {

                        var favoriteList = userFavorite;
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
                                    padding:EdgeInsets.only(left: 10,right: 30, top:4, bottom: 4),
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
                                  padding: EdgeInsets.only(left: 20, right: 30),
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

                                             cart.deleteFavorite(favoriteList[i].idFavorite);
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
                    ),
                Center(
                  child: Center(
                    child: RaisedButton(
                      onPressed: (){
                        cart.createFavorite(cart.userFavorite);
                      },
                      child: Text('cap nhat danh sach yeu thich'),
                    ),
                  ),
                )

              ]),
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
            ));
          },
        );


  }
}