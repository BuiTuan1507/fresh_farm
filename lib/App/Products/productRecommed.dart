
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';

import 'package:fresh_farm/App/Products/Detail.dart';


import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/service.dart';
import 'package:provider/provider.dart';
class Test extends StatefulWidget{
  String uid;
  Test({Key key, this.uid}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}
class _TestState extends State<Test> {
  double rating = 3.2;
  Widget build(BuildContext context) {
    List userList = Provider.of<List<Item>>(context);
    FirebaseService firebaseServices = FirebaseService();
    return Consumer<Cart>(builder: (context, cart, child) {

      cart.addUser(widget.uid);
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping cart'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Checkout()));
                    },
                  ),
                  Text(cart.ListItem.length.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(7),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1.1,
          ),
          itemCount: 5,
          itemBuilder: (_, i,) {
          rating = userList[i].rating;
            return new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green[500])
                ),
                color: Colors.white70,
                  child: Expanded(
                    child: Column(
                    children: <Widget>[
                      InkWell(
                    onTap: () {
                      cart.addInfoItem(userList[i]);
                      Navigator.of(_).push(

                          MaterialPageRoute(builder: (context) => Detail()));

                    },
                      child : Container(
                        height: 83,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(userList[i].imgPath),
                                fit: BoxFit.fitWidth,)))),

                        Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(left: 10,right: 20,top: 5),

                                                child: Text(userList[i].name,
                                                    style: TextStyle(
                                                        color: Color(0xFF575E67),
                                                        fontFamily: 'Varela',
                                                        fontSize: 15.0)),

                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(left: 10,right: 20,top: 5),
                                                child:Text("\$${userList[i].price}",
                                                    style: TextStyle(
                                                        color: Color(0xFFCC8053),
                                                        fontFamily: 'Varela',
                                                        fontSize: 12.0)),

                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star,color: Colors.orange,),
                                            Container(
                                              padding: EdgeInsets.only(left: 5,top: 5),
                                              child:  Text('$rating',style: TextStyle(fontSize: 16,color: Colors.orange),),
                                            ),
                                          ],
                                        ), Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text('(5)',style: TextStyle(fontSize: 16, color: Colors.black45),
                                              ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 5,right: 15, bottom: 10),
                                        height: 20,
                                        child: IconButton(
                                          iconSize: 20,
                                          color: (userList[i].isLike? Colors.red[800]:Colors.white),
                                          icon: Icon(Icons.favorite,size: 20,),
                                          onPressed: () {
                                            cart.addFavorite(userList[i]);
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: IconButton(
                                          iconSize: 20,
                                          icon: Icon(Icons.add_shopping_cart,size: 20,),
                                          onPressed: () {
                                            //   bloc.addToCart(shopList[i]);
                                            cart.add(userList[i]);
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),

                              ),
                                  ],

                              )));





          },
        )
      );
    });
  }
}






