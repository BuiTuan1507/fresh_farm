import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class MyCartPage extends StatefulWidget{
  _MyCartPageState createState() => new _MyCartPageState(); // ghi de 1 doi tuong trang thai private
}
class _MyCartPageState extends State<MyCartPage> {
  String name;
  String image;
  int count;
  int price;



  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
          title: Text("FreshFarm",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //
            children: <Widget>[])
    );
  }
}
class Cart {
  String name, image;
  String price;

  Cart ( String name, String image, String price){
    this.name = name;

    this.image = image;
    this.price = price;

  }


}
class MyCart{
  Cart cart;
  MyCart(Cart cart){
    this.cart = cart;
}
  List<Cart> myListCart = List<Cart>();
  void addCart(Cart cart){
    myListCart.add(cart);
  }
  void removeCart(Cart cart){
    myListCart.remove(cart);
  }
}