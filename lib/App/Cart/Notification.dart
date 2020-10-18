import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:fresh_farm/App/Products/Detail.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';

class Sale extends StatefulWidget {
  @override
  _SaleState createState() => _SaleState();
  String uid;
  Sale({Key key, this.uid}) : super(key: key);
}

class _SaleState extends State<Sale> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,cart,child){
      return Scaffold(
        appBar:AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text("Thong bao",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
        body: StreamBuilder(
          stream:  Firestore.instance
              .collection('Notification')

              .snapshots(),
          builder: (context, snapshot) {

            return (snapshot.hasData != null)
                ? Column(
              children: <Widget>[

                Expanded(
                    child: ListView.builder(


                      shrinkWrap: true,
                      //itemCount: cart.FavoriteItem.length,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, i) {
                        DocumentSnapshot cartList = snapshot.data.documents[i];

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
                                                  image: AssetImage(cartList['imgPath']),
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
                                              child: Text('artList', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                              )
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding :EdgeInsets.only(bottom: 0),
                                            child: Text(cartList['text'], style: TextStyle(fontSize: 15, color: Colors.black),
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


              ],
            )
                : Column(
              children: <Widget>[
                Center(child: Text("khong co thong bao moi",style: TextStyle(fontSize: 24),)),
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

