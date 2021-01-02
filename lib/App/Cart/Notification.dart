import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fresh_farm/App/Products/Category.dart';

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
    Size size = MediaQuery.of(context).size;
    return Consumer<Cart>(builder: (context,cart,child){
      return Scaffold(
        appBar:AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF0C9869),
            title: Text("Khuyến mãi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
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
                          width: size.width,
                          padding: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.green[500])
                            ),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    padding:EdgeInsets.only(left: 10,right: 10, top:4, bottom: 4),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(

                                            MaterialPageRoute(builder: (context) => MyCategoryPage(

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
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[

                                              Center(
                                                  child: Text(cartList['name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                                  )
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 30,top: 5),
                                                child: Text(
                                                  "-${cartList['time']}%", style: TextStyle(fontSize:24,fontWeight:FontWeight.bold,color: Colors.orange),
                                                ),


                                          )

                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4,left: 10,right: 10),
                                        width: size.width*0.6,
                                        child: Flexible(

                                            child: Text(cartList['text'], overflow: TextOverflow.fade,style: TextStyle(fontSize: 15, color: Colors.black),
                                            )
                                            ,),


                                      ),


                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,)



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
                Center(child: Text("Chưa có thông tin giam giá",style: TextStyle(fontSize: 24),)),
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

