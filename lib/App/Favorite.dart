import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fresh_farm/App/Products/Category.dart';

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
    Size size = MediaQuery.of(context).size;
    List<Favorite> userList1 = Provider.of<List<Favorite>>(context);

    return Consumer<Cart>(builder: (context,cart,child){
      List userFavorite = [];
      if (userList1 != null){
      for (int i=0;i<userList1.length;i++){
        if(userList1[i].uid == widget.uid){
          userFavorite.add(userList1[i]);
          }
        }
      }
      return Scaffold(
        appBar:AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF0C9869),
            title: Text("Yêu thích",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
        body:(userFavorite != null)
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
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    padding:EdgeInsets.only(left: 10,right: 15, top:4, bottom: 4),
                                    child: InkWell(
                                      onTap: () {

                                        Item item123 = new Item(userFavorite[i].id,userFavorite[i].name,userFavorite[i].imgPath,userFavorite[i].price,userFavorite[i].count,userFavorite[i].isLike,userFavorite[i].rating);
                                        cart.addInfoItem(item123);
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
                                Positioned(
                                  top:10,
                                  bottom: 10,
                                  left: size.width*0.35,
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
                                Positioned(
                                  top: 12,
                                  bottom: 12,
                                  left: size.width*0.65,
                                  child:  Container (
                                          child :IconButton(
                                            icon: Icon(Icons.delete,color: Colors.green[800],),
                                            onPressed: () {

                                             cart.deleteFavorite(favoriteList[i].idFavorite);
                                            },
                                          ),
                                  ),
                                )


                              ],
                            ),
                          )
                          ,
                        );



                      },
                    ),
                Container(height: 40,),
                Center(
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: InkWell(

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>MyCategoryPage(uid: cart.uid,)));
                      },
                      child: Center(
                        child: Text('Xem thêm sản phẩm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:Colors.white),),
                      )

                    ),
                  ),
                )

              ]),
            )
                : Column(
              children: <Widget>[
                Center(child: Text("Bạn chưa có sản phẩm yêu thích nào",style: TextStyle(fontSize: 22),)),
                Container(height: 40,),
                Center(
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: InkWell(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>MyCategoryPage(uid: cart.uid,)));
                        },
                        child: Center(
                          child: Text('Xem thêm sản phẩm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:Colors.white),),
                        )

                    ),
                  ),
                )
              ],
            ));
          },
        );


  }
}