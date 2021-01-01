import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/TabBarCart.dart';
import 'package:intl/intl.dart';
class ListProductShipping extends StatefulWidget {
  int id;
  ListProductShipping({Key key, this.id}) : super(key: key);
  @override
  _ListProductShippingState createState() => _ListProductShippingState();
}

class _ListProductShippingState extends State<ListProductShipping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Thông tin đơn hàng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
        backgroundColor: Color(0xFF0C9869),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('cart')
            .where("id",isEqualTo: widget.id)
            .snapshots(),
        builder:(context,snapshot){
          var cFormat;
          var eFormat;
          if (snapshot.hasData != null)
          {
            var createTime = snapshot.data.documents[0]['createTime'].toDate();
            var endTime = snapshot.data.documents[0]['endTime'].toDate();
            var createTimeFormat = DateFormat('H:m  dd-MM-yyyy');
            cFormat = createTimeFormat.format(createTime);
            eFormat = createTimeFormat.format(endTime);
          }

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
                                          child: Text('${cartList[i]['count']} kg', style: TextStyle(fontSize: 15, color: Colors.black),
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
              Container(height: 80,),
              Container(
                height: 40,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TabBarCart()));
                    },
                    child: Text(
                      "Quay về trang giỏ hàng",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
             ])
              : Center(child: Text("Hiện tại không còn đơn hàng nào đang được giao"));
        },
      ),
    );
  }
}
