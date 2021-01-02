import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
import 'Rating1.dart';

class RatingAndReview extends StatefulWidget {
  @override
  _RatingAndReviewState createState() => _RatingAndReviewState();
}

class _RatingAndReviewState extends State<RatingAndReview> {
  int id;
  String uid;

  @override
  Widget build(BuildContext context) {
    List userList = Provider.of<List<Rating>>(context);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    // return Consumer<Cart>(
    // builder: (context,cart,child){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0C9869),
          elevation: 0.0,
          centerTitle: true,
          title: Text('Rating and Review',
              style: TextStyle(
                  fontFamily: 'Varela', fontSize: 20.0, color: Colors.white)),
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            int count = 0;
            List<Rating> now = []; //
            if (userList == null) {
              count = 0;
              print(cart.idRating);
            } else {
              uid = cart.uid; // uid

              print(cart.uid);
              for (int i = 0; i < userList.length; i++) {
                // tinh count va add cac binh luan vao 1 list
                if (cart.idRating == userList[i].id) {
                  count = count + 1;
                  now.add(userList[i]);
                }
              }
            }
            return count > 0
                ? Column(children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: count,
                            itemBuilder: (BuildContext context, i) {
                              final cartList = now;

                              return new Container(
                                  height: 100,
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5, right: 10),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Colors.green[500])),
                                    color: Colors.white,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 0,
                                                right: 20,
                                                top: 4,
                                                bottom: 4),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  width: 80,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              cartList[i]
                                                                  .photoURL),
                                                          fit: BoxFit.fill))),
                                            )),
                                        Positioned(
                                            top: 10,
                                            bottom: 5,
                                            left: queryData.size.width * 0.23,
                                            child: Text(
                                              cartList[i].name,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green[800]),
                                            )),
                                        Positioned(
                                            top: 10,
                                            left: queryData.size.width * 0.65,
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '${cartList[i].rating}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green[800]),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 22,
                                                  color: Colors.orange,
                                                )
                                              ],
                                            )),
                                        Positioned(
                                          top: 5,
                                          left: queryData.size.width * 0.65,
                                          child: Row(
                                            children: <Widget>[
                                              (cart.uid == cartList[i].uid)
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          left: 40),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          cart.deleteReview(
                                                              cartList[i].id,
                                                              cart.uid,cartList[i].idRating);
                                                        },
                                                        icon: Icon(
                                                          Icons.delete,
                                                          size: 25,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 0,
                                                    ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 28,
                                          left: queryData.size.width * 0.23,
                                          child:  Container(
                                            padding: EdgeInsets.only(top: 4,left: 10,right: 10),
                                            width: queryData.size.width*0.6,
                                            child: Flexible(

                                              child: Text(cartList[i].text, overflow: TextOverflow.fade,style: TextStyle(fontSize: 15, color: Colors.black),
                                              )
                                              ,),


                                          ),

                                        ),
                                      ],
                                    ),
                                  ));
                            })),
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green[500])),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Rating1()));
                          },
                          child: Text(
                            'Đánh giá sản phẩm',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ])
                : Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'Sản phẩm không có đánh giá nào',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 20, bottom: 30),
                          child: Center(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green[500])),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Rating1()));
                              },
                              child: Text(
                                'Đánh giá sản phẩm',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  );
          },
        ));
    //}

    //);
  }
}

