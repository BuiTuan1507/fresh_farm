import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fresh_farm/App/Cart/Pay.dart';
import 'package:provider/provider.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String uid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          int ramdomNumber() {
            int x = cart.totalPrice(cart.ListItem) * 10;
            int y = 0;
            for (int i = 0; i < cart.ListItem.length; i++) {
              y = y + cart.ListItem[i].id;
            }
            return x - y;
          }

          return cart.ListItem.length > 0
              ? Column(
                  children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.ListItem.length,
                      itemBuilder: (BuildContext context, i) {
                        final cartList = cart.ListItem;

                        void add() {
                          setState(() {
                            cart.ListItem[i].count++;
                          });
                        }

                        void minus() {
                          setState(() {
                            if (cart.ListItem[i].count != 1) {
                              cart.ListItem[i].count--;
                            }
                          });
                        }

                        return new Container(
                          height: 100,
                          padding: EdgeInsets.only(
                              left: 20, top: 5, bottom: 5, right: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.green[500])),
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 15, top: 4, bottom: 4),
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.of(context).push(

                                        //   MaterialPageRoute(builder: (context) => Detail(
                                        //     itemProduct: cartList[i],
                                        //)));
                                      },
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      cartList[i].imgPath),
                                                  fit: BoxFit.fill))),
                                    )),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: size.width * 0.3,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Center(
                                              child: Text(
                                            cartList[i].name,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[800]),
                                          ))
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              '\$${cartList[i].price}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 35,
                                            height: 35,
                                            padding: EdgeInsets.only(right: 12),
                                            child: new FloatingActionButton(
                                              onPressed: add,
                                              child: new Icon(
                                                Icons.add,
                                                color: Colors.green[800],
                                              ),
                                              backgroundColor: Colors.white,
                                              heroTag: null,
                                            ),
                                          ),
                                          new Text('${cart.ListItem[i].count}',
                                              style: new TextStyle(
                                                  fontSize: 16.0)),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            padding: EdgeInsets.only(left: 12),
                                            child: new FloatingActionButton(
                                              onPressed: minus,
                                              child: new Icon(
                                                  const IconData(0xe15b,
                                                      fontFamily:
                                                          'MaterialIcons'),
                                                  color: Colors.green[800]),
                                              backgroundColor: Colors.white,
                                              heroTag: null,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  bottom: 12,
                                  left: size.width * 0.65,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.green[800],
                                            ),
                                            onPressed: () {
                                              cart.remove(cartList[i]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Giá tiền:                  ${cart.totalPrice(cart.ListItem)}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Phí vận chuyển:     ${cart.totalPrice(cart.ListItem)}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Tổng số tiền:      ${cart.totalPrice(cart.ListItem)}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            //  cart.createCart(cart.ListItem, cart.uid,'1,DaiLa,Hoang Mai',cart.totalPrice(cart.ListItem),ramdomNumber());
                            //  cart.addListCart(ramdomNumber(), cart.uid,cart.totalPrice(cart.ListItem) , 'assets/1.jpg');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Pay(
                                          ramdomNumber: ramdomNumber(),
                                        )));
                          },
                          child: Text(
                            "Thanh Toán",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(height: 40,)
                  ],
                )
              : Center(
                  child: Text(
                  "Giỏ hàng trống",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ));
        },
      ),
    );
  }
}
