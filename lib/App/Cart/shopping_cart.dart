import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fresh_farm/App/Products/Detail.dart';
import 'cart_item_bloc.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("Giỏ hàng",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {

          return snapshot.data['cart items'].length > 0
              ? Column(
            children: <Widget>[

                Expanded(
                  child: ListView.builder(


                    shrinkWrap: true,
                    itemCount: snapshot.data["cart items"].length,
                    itemBuilder: (BuildContext context, i) {
                      final cartList = snapshot.data["cart items"];
                      int n = cartList[i]['count'];
                      void add(){
                        setState(() {
                          n++;
                        });
                      }
                      void minus(){
                        setState(() {
                          if(n != 0)
                            n--;
                        });
                      }


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
                                              itemProduct: cartList[i],
                                          )));
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
                                padding: EdgeInsets.only(left: 20, right: 30),
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
                                          child: Text('\$${cartList[i]['price']}', style: TextStyle(fontSize: 15, color: Colors.black),
                                          )
                                          ,)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: EdgeInsets.only(right: 12),

                                          child: new FloatingActionButton(
                                            onPressed: add,
                                            child: new Icon(Icons.add, color: Colors.green[800],),
                                            backgroundColor: Colors.white,
                                            heroTag: null,
                                          ),
                                        ),

                                        new Text('$n',
                                            style: new TextStyle(fontSize: 16.0)),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          padding: EdgeInsets.only(left: 12),
                                          child:  new FloatingActionButton(
                                            onPressed: minus,
                                            child: new Icon(
                                                const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                                                color: Colors.green[800]),
                                            backgroundColor: Colors.white,
                                            heroTag: null,),
                                        ),


                                      ],

                                    )

                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child:  Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.delete,color: Colors.green[800],),
                                          onPressed: () {
                                            bloc.removeFromCart(cartList[i]);
                                          },
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              )


                            ],
                          ),
                        )
                        ,
                      );



                    },
                  )
                ),
                Container(
                padding: EdgeInsets.only(left: 30),
                child:  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Giá tiền:             ${snapshot.data['total']}',style: TextStyle(fontSize: 18, color: Colors.black),)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Phí vận chuyển:     ${snapshot.data['delivery']}',style: TextStyle(fontSize: 18),)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Tổng số tiền:      ${snapshot.data['subTotal']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.green[800]),)
                        ],
                      )
                    ],
                  ),
              ) ,



                  RaisedButton(
                    onPressed: () {},
                    child: Text("Thanh toan"),
                color: Colors.green,
              ),
              SizedBox(height: 40)
            ],
          )
              : Center(child: Text("Gio hang trong"));
        },
      ),
    );
  }
}

