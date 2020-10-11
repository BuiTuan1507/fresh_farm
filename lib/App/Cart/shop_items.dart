import 'package:fresh_farm/App/Products/Detail.dart';
import 'package:fresh_farm/Model/service.dart';

import 'cart_item_bloc.dart';
import 'package:flutter/material.dart';

class ShopItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Product",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["shop items"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Center(child: Text("Ban da mua het hang"));
      },
    );
  }
}

Widget shopItemsListBuilder(snapshot) {

  return GridView.builder(
    padding: EdgeInsets.all(7),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 1.1,
    ),
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return new Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green[500])
          ),
          color: Colors.white,
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(

                    MaterialPageRoute(builder: (context) => Detail(
                        itemProduct: shopList[i],
                    )));

                bloc.addToInfo(shopList[i]);

              },
              child: Container(
                //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(

                      children: [

                        Expanded(
                          //tag: imgPath,
                            child: Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(shopList[i]['imgPath']),
                                        fit: BoxFit.fill)))),
                        //SizedBox(height: 7.0),
                        Column(
                          children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 10),

                                      child: Text(shopList[i]['name'],
                                          style: TextStyle(
                                              color: Color(0xFF575E67),
                                              fontFamily: 'Varela',
                                              fontSize: 20.0)),

                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 30),
                                     child:Text("\$${shopList[i]['price']}",
                                          style: TextStyle(
                                              color: Color(0xFFCC8053),
                                              fontFamily: 'Varela',
                                              fontSize: 18.0)),

                                  ),

                                ],
                              ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 10.0, right: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children:<Widget> [
                                      Container(
                                        padding: EdgeInsets.only(left: 5,right: 15),
                                        child: IconButton(
                                          color: (shopList[i]['isLike']? Colors.red[800]:Colors.white),
                                          icon: Icon(Icons.favorite,),
                                          onPressed: () {
                                            bloc.addToFavorite(shopList[i]);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: IconButton(

                                          icon: Icon(Icons.add_shopping_cart),
                                          onPressed: () {
                                            bloc.addToCart(shopList[i]);
                                          },
                                        ),
                                      ),

                                    ],

                                  ),
                                )
                              ],
                            )
                          ],
                        ),


                      ]))));


    },
  );
}