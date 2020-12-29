
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Shipping extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Đơn hàng đang giao", style: TextStyle(fontSize: 20),),
        backgroundColor: Color(0xFF0C9869),

      ),
      body:
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Text("Thời gian mua hàng: ${createTime}"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text("Thời gian giao hàng hàng: ${createTime}"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text("Id: ${id}"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text("Tổng giá tiền : ${total}"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text("Xem thông tin chi tiết"),
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
                            child: Icon(Icons.offline_pin, size: 28,color: Colors.orange,),
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightGreenAccent,
                            ),

                            child: Text(
                                "Đơn hàng đang xử lí"
                            ),
                          )
                        ],
                      ),

                      Container(
                        height: 30,
                        child:
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                          ),

                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.timer, size: 28,color: Colors.orange,),
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightGreenAccent,
                            ),

                            child: Text(
                                "Đơn hàng đang xử lí"
                            ),
                          )
                        ],
                      ),

                      Container(
                        height: 30,
                        child:
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                      ),
                      Container(
                        child: Icon(Icons.directions_car, size: 28,color: Colors.orange,),
                      ),
                      Container(
                        height: 30,
                        child:
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                      ),
                      Container(
                        child: Icon(Icons.folder, size: 28,color: Colors.orange,),
                      ),
                    ],
                  ),

                ],
              )


            ],
          )

    );
  }
}

