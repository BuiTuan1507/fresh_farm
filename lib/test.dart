import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';
import 'package:fresh_farm/App/Model/user.dart';
import 'package:fresh_farm/App/Products/Detail.dart';


import 'package:flutter/material.dart';
import 'package:fresh_farm/Model/service.dart';
import 'package:provider/provider.dart';
class Test extends StatefulWidget{
  @override
  _TestState createState() => _TestState();
}
class _TestState extends State<Test> {
  Widget build(BuildContext context) {
    List userList = Provider.of<List<Item>>(context);
    FirebaseService firebaseServices = FirebaseService();
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping cart'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Checkout()));
                    },
                  ),
                  Text(cart.ListItem.length.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: shopItemsListBuilder(userList,cart)
      );
    });
  }
}





Widget shopItemsListBuilder(List userList,Cart cart) {

  return GridView.builder(
    padding: EdgeInsets.all(7),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 1.1,
    ),
    itemCount: 4,
    itemBuilder: (_, i,) {
      return new Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green[500])
          ),
          color: Colors.white,
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(_, '/checkout');

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
                                        image: AssetImage(userList[i].imgPath),
                                        fit: BoxFit.fill)))),
                        //SizedBox(height: 7.0),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 10),

                                  child: Text(userList[i].name,
                                      style: TextStyle(
                                          color: Color(0xFF575E67),
                                          fontFamily: 'Varela',
                                          fontSize: 20.0)),

                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 30),
                                  child:Text("\$${userList[i].price}",
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
                                          color: (userList[i].isLike? Colors.red[800]:Colors.white),
                                          icon: Icon(Icons.favorite,),
                                          onPressed: () {
                                         //   bloc.addToFavorite(shopList[i]);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: IconButton(

                                          icon: Icon(Icons.add_shopping_cart),
                                          onPressed: () {
                                         //   bloc.addToCart(shopList[i]);
                                            cart.add(userList[i]);
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