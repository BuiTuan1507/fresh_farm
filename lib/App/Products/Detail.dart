import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/TabBarCart.dart';

import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';
import 'package:fresh_farm/App/Products/Category.dart';
import 'package:fresh_farm/App/Products/RatingAndReview.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF0C9869),
              centerTitle: true,
              title: Text('Chi tiết sản phẩm',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                      color: Colors.white)),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    cart.removeInfoItem(cart.infoItem[0]);
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 30,
                  onPressed: () {
                    cart.removeInfoItem(cart.infoItem[0]);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TabBarCart()));
                  },
                ),
              ],
            ),
            body: Consumer<Cart>(
              builder: (context, cart, child) {
                return InfoItemsListBuilder(context, cart);
              },
            ));
      },
    );
  }
}

Widget InfoItemsListBuilder(context, cart) {
  Size size = MediaQuery.of(context).size;
  final infoItem = cart.infoItem;

  return SingleChildScrollView(
      child: Column(
    children: <Widget>[
      Hero(
        tag: infoItem[0].imgPath,
        child: Image.asset(
          infoItem[0].imgPath,
          height: size.height * 0.3,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
      Center(
        child: Text('\$${infoItem[0].price}',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0C9869))),
      ),
      SizedBox(height: 10.0),
      Center(
        child: Text(infoItem[0].name,
            style: TextStyle(
                color: Color(0xFF575E67),
                fontFamily: 'Varela',
                fontSize: 28.0)),
      ),
      SizedBox(height: 20.0),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50.0,
          child: Text(
              'Được nuôi trồng với quy trình vietGap từ khâu chọn giống đến khâu thu hoạch, sản phẩm sẽ cung cấp một sức khỏe tốt nhất đến gia đình bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Varela', fontSize: 16.0, color: Colors.black)),
        ),
      ),
      SizedBox(height: 20.0),
      Center(
          child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFF0C9869)),
              child: Center(
                  child: InkWell(
                      onTap: () {
                        cart.add(infoItem[0]);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TabBarCart()));
                      },
                      child: Text(
                        'Thêm vào giỏ hàng',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))))),
      Container(height: 20,),
      Row(
        children: <Widget>[
          Container(width: 10,),
          Container(
            height: 45,

              padding: EdgeInsets.only(top: 12, left: 15, right: 10, ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),color: Color.fromRGBO(220, 230, 235, 1)),

              child:  GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyCategoryPage()));
                  cart.removeInfoItem(infoItem[0]);
                },
                child: Text(
                  "Xem thêm sản phẩm",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),



            ),


            Container(width: 10,),
              Container(
                height: 45,

                padding: EdgeInsets.only(top: 12, left: 15, right: 10, ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),color: Color.fromRGBO(220, 230, 235, 1)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RatingAndReview()));
                    cart.getIdRating(infoItem[0]);
                   // cart.removeInfoItem(infoItem[0]);
                  },
                  child: Text(
                    'Đánh giá sản phẩm',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),

          ),
          Container(width: 10,)
        ],
      )
    ],
  ));
}
