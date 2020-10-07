import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fresh_farm/App/Products/Detail.dart';
import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("Yeu thich",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {

          return snapshot.data['favorite items'].length > 0
              ? Column(
            children: <Widget>[

              Expanded(
                  child: ListView.builder(


                    shrinkWrap: true,
                    itemCount: snapshot.data["favorite items"].length,
                    itemBuilder: (BuildContext context, i) {
                      final cartList = snapshot.data["favorite items"];
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
                                            bloc.removeFromFavorite(cartList[i]);
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

            ],
          )
              : Column(
                children: <Widget>[
                  Center(child: Text("Bạn chưa có sản phẩm yêu thích nào",style: TextStyle(fontSize: 24),)),
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
  }
}

