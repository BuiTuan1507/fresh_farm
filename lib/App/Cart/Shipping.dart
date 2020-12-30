
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/ListProductShipping.dart';
import 'package:intl/intl.dart';
class Shipping extends StatefulWidget {
  int id;
  Shipping({Key key, this.id}) : super(key: key);
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  String createTime = "20-12-2020 16:00";
  String endTime = "20-12-2020 18:00";
  String id = "45s321";
  String total = "50";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Đơn hàng đang giao", style: TextStyle(fontSize: 20),),
        backgroundColor: Color(0xFF0C9869),

      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('cart')
            .where("id",isEqualTo: widget.id)
            .snapshots(),
        builder:(context,snapshot) {
          var cFormat;
          var eFormat;
          if (snapshot.hasData != null) {
            var createTime = snapshot.data.documents[0]['createTime'].toDate();
            var endTime = snapshot.data.documents[0]['endTime'].toDate();
            var createTimeFormat = DateFormat('H:m  dd-MM-yyyy');
            cFormat = createTimeFormat.format(createTime);
            eFormat = createTimeFormat.format(endTime);
          }

          return (snapshot.hasData != null)
              ?
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                    child: Text("Thời gian mua hàng: ${cFormat}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Text("Thời gian giao hàng hàng: ${eFormat}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Text("Id: ${snapshot.data.documents[0]['id']}", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Text("Tổng giá tiền : ${snapshot.data.documents[0]['price']}", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => ListProductShipping(id: snapshot.data.documents[0]['id'],)));

                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text("Xem thông tin chi tiết",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight
                              .w400)),
                    ),
                  )

                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 15, right: 15, bottom: 10),
                            child: Icon(Icons.offline_pin, size: 28,
                              color: Colors.orange,),
                          ),
                          Container(
                              height: 40,
                              width: size.width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightGreenAccent,
                              ),

                              child: Center(
                                child: Text(
                                    "Đơn hàng đang xử lí"
                                ),
                              )

                          )
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 22),
                        height: 30,
                        width: size.width * 0.9,
                        alignment: Alignment.centerLeft,
                        child:
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 15, right: 15, bottom: 10),
                            child: Icon(Icons.offline_pin, size: 28,
                              color: Colors.orange,),
                          ),
                          Container(
                              height: 40,
                              width: size.width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightGreenAccent,
                              ),

                              child: Center(
                                child: Text(
                                    "Đơn hàng đang xử lí"
                                ),
                              )

                          )
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 22),
                        height: 30,
                        width: size.width * 0.9,
                        alignment: Alignment.centerLeft,
                        child:
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 15, right: 15, bottom: 10),
                            child: Icon(Icons.offline_pin, size: 28,
                              color: Colors.orange,),
                          ),
                          Container(
                              height: 40,
                              width: size.width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightGreenAccent,
                              ),

                              child: Center(
                                child: Text(
                                    "Đơn hàng đang xử lí"
                                ),
                              )

                          )
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 22),
                        height: 30,
                        width: size.width * 0.9,
                        alignment: Alignment.centerLeft,
                        child:
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 15, right: 15, bottom: 10),
                            child: Icon(Icons.offline_pin, size: 28,
                              color: Colors.orange,),
                          ),
                          Container(
                              height: 40,
                              width: size.width * 0.75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightGreenAccent,
                              ),

                              child: Center(
                                child: Text(
                                    "Đơn hàng đang xử lí"
                                ),
                              )

                          )
                        ],
                      ),

                    ],
                  ),

                ],
              )


            ],
          ) : Center(
              child: Text("Hiện tại không còn đơn hàng nào đang được giao"));
        }));
  }
}

