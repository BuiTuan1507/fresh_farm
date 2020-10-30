import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';

class ShipCart extends StatefulWidget {
  @override
  _ShipCartState createState() => _ShipCartState();
}

class _ShipCartState extends State<ShipCart> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String uid;


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('cart')
            .where("user",isEqualTo: '0oULJrkVt3bTsqetIYgTY75ucP03')
            .snapshots(),
        builder:(context,snapshot){

          return (snapshot.hasData !=null)
              ? Column(
            children: <Widget>[

              SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents[0]['item'].length,
                    itemBuilder: (BuildContext context, i) {
                      final cartList = snapshot.data.documents[0]['item'];
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
                                                image: AssetImage(cartList[i]['imgPath']),
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
                                            child: Text(cartList[i]['name'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding :EdgeInsets.only(bottom: 0),
                                          child: Text('\$${cartList[i]['count']}', style: TextStyle(fontSize: 15, color: Colors.black),
                                          )
                                          ,)
                                      ],
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        )
                        ,
                      );



                    },
                  )
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child:Text(
                      DateFormat('dd/MM/yyyy kk:mm')
                          .format(DateTime
                          .fromMillisecondsSinceEpoch(int.parse(snapshot.data.documents[0]['createTime']))),

                    ),

                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child:Text(
                      DateFormat('dd/MM/yyyy kk:mm')
                          .format(DateTime
                          .fromMillisecondsSinceEpoch(int.parse(snapshot.data.documents[0]['endTime']))),

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('${snapshot.data.documents[0]['price']} ', style: TextStyle(fontSize: 18),),
                  )
                ],
              )
            ],
          )
              : Center(child: Text("Hien tai khong co don hang nao duoc giao"));
        },
      ),
    );
  }
}

