import 'package:badges/badges.dart';
import 'package:fresh_farm/App/Cart/TabBarCart.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';

import 'package:fresh_farm/App/Products/Detail.dart';

import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/service.dart';
import 'package:provider/provider.dart';

class Trungsua extends StatefulWidget {
  String uid;
  String name;
  String photoURL;
  String email;

  Trungsua({Key key, this.uid, this.name, this.photoURL, this.email})
      : super(key: key);

  @override
  _TrungsuaState createState() => _TrungsuaState();
}

class _TrungsuaState extends State<Trungsua> {
  Widget build(BuildContext context) {
    List<Favorite> favorite = Provider.of<List<Favorite>>(context);
    List<Item> userList1 = Provider.of<List<Item>>(context);
    FirebaseService firebaseServices = FirebaseService();
    Size size = MediaQuery.of(context).size;
    return ((userList1 != null) && (favorite != null))
        ? Consumer<Cart>(builder: (context, cart, child) {
      cart.addUser(
          widget.uid, widget.name, widget.photoURL, widget.email);
      List<Item> userList = [];
      List<int> chiso = [57, 58, 59, 60, 61, 62];
      for (int i = 0; i < userList1.length; i++) {
        for (int j = 0; j < 6; j++) {
          if (userList1[i].id == chiso[j]) {
            userList.add(userList1[i]);
            break;
          }
        }
      }
      List<int> t = [0, 0, 0, 0, 0, 0, 0, 0]; //  hien thi favorite
      List<int> x = [0, 0, 0, 0, 0, 0, 0, 0]; // hien thi cart
      List<Favorite> userFavorite = [];
      for (int i = 0; i < favorite.length; i++) {
        if (favorite[i].uid == cart.uid) {
          userFavorite.add(favorite[i]);
          // print(favorite[i].name);
          // print(favorite[i].id);
        }
      }

      for (int i = 0; i < userFavorite.length; i++) {
        for (int j = 0; j < 6; j++) {
          if (userFavorite[i].id == userList[j].id) {
            //userList[j].isLike = true;
            //print(userList[j].id);
            t[j] = 1;
          }
        }
      }

      if (cart.ListItem != null) {
        for (int i = 0; i < cart.ListItem.length; i++) {
          for (int j = 0; j < 6; j++) {
            if (cart.ListItem[i].id == userList[j].id) {
              x[j] = 1;
            }
          }
        }
      }

      return Scaffold(
          appBar: AppBar(
            title: Text('Trứng sữa'),
            backgroundColor: Color(0xFF0C9869),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        cart.ListItem.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        iconSize: 30,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TabBarCart()));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
            centerTitle: true,
          ),
          body: shopItemsListBuilder(
              userList, cart, this.widget.uid, t, x));
    })
        : Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Text(
          "Loading",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ));
  }

  Widget shopItemsListBuilder(
      List userList, Cart cart, String uid, List t, List x) {
    return GridView.builder(
      padding: EdgeInsets.all(7),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 1.1,
      ),
      itemCount: userList.length,
      itemBuilder: (
          _,
          i,
          ) {
        return new Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.green[500])),
            color: Colors.white,
            child: InkWell(
                onTap: () {
                  cart.addInfoItem(userList[i]);
                  Navigator.of(_)
                      .push(MaterialPageRoute(builder: (context) => Detail()));
                },
                child: Container(
                  //color: Color(0xFFEFDB),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        color: Color(0xFFEFDB)),
                    child: Column(children: [
                      Expanded(
                        //tag: imgPath,
                          child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(userList[i].imgPath),
                                      fit: BoxFit.fill)))),
                      //SizedBox(height: 7.0),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(userList[i].name,
                                    style: TextStyle(
                                        color: Color(0xFF575E67),
                                        fontFamily: 'Varela',
                                        fontSize: 17.0)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: Text("\$${userList[i].price}",
                                    style: TextStyle(
                                        color: Color(0xFFCC8053),
                                        fontFamily: 'Varela',
                                        fontSize: 16.0)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding:
                                EdgeInsets.only(left: 10.0, right: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                      EdgeInsets.only(left: 5, right: 15),
                                      child: IconButton(
                                        color: ((t[i] != 0)
                                            ? Colors.red[800]
                                            : Colors.white),
                                        icon: Icon(
                                          Icons.favorite,
                                        ),
                                        onPressed: () {
                                          if (t[i] != 0) {
                                            //cart.removeFavorite(userList[i]);
                                            t[i] = 0;
                                            cart.deleteFavorite(cart.uid +
                                                userList[i].id.toString());
                                          } else {
                                            t[i] = 1;
                                            cart.createItemFavorite1(
                                                userList[i], cart.uid);
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: IconButton(
                                        color: ((x[i] != 0)
                                            ? Colors.blue
                                            : Colors.black),
                                        icon: Icon(Icons.add_shopping_cart),
                                        onPressed: () {
                                          cart.add(userList[i]);
                                          setState(() {
                                            x[i] = 1;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ]))));
      },
    );
  }
}
