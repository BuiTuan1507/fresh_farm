import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class ListShipCart extends StatefulWidget {
  @override
  _ListShipCartState createState() => _ListShipCartState();
}

class _ListShipCartState extends State<ListShipCart> {
  @override
  Widget build(BuildContext context) {
    List<ListCart> userList1 = Provider.of<List<ListCart>>(context);

    return Consumer<Cart>(builder: (context,cart,child){
      List userFavorite = [];
      int count = 0;
      if(userList1.length != 0){
        var timeNow = DateTime.now();
        for (int i =0 ;i<userList1.length;i++){
          var timeShip = userList1[i].endTime.toDate();
          if (timeShip.isAfter(timeNow)){
            count = count + 1;
            userFavorite.add(userList1[i]);
          }
        }
      }


      return Scaffold(

          body:(userFavorite.length != 0)
              ?
          SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Text('Ban co ${count} don hang dang giao',textAlign: TextAlign.center,style: TextStyle(fontSize:17),),
                  ListView.builder(


                    shrinkWrap: true,
                    //itemCount: cart.FavoriteItem.length,
                    itemCount: userFavorite.length,
                    itemBuilder: (BuildContext context, i) {
                      var createTime = userFavorite[i].createTime.toDate();
                      var endTime = userFavorite[i].endTime.toDate();
                      var createTimeFormat = DateFormat('H:m  dd-MM-yyyy');
                      var cFormat = createTimeFormat.format(createTime);
                      var eFormat = createTimeFormat.format(endTime);

                      var favoriteList = userFavorite;
                      return new Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green[500])
                          ),
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  padding:EdgeInsets.only(left: 5,right: 5, top:4, bottom: 4),
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
                                                image: AssetImage(userFavorite[i].imgPath),
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
                                            child: Text("Don hang dang giao", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding :EdgeInsets.only(bottom: 0),
                                          child: Text('\$${userFavorite[i].price}', style: TextStyle(fontSize: 15, color: Colors.black),
                                          )
                                          ,)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text('Mua hang luc: ${cFormat}'),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text('Giao hang truoc: ${eFormat}'),
                                        )
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
                  ),


                ]),
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
          ));
    },
    );


  }

}
