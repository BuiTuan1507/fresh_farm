import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';

import 'package:fresh_farm/App/Products/Detail.dart';


import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/service.dart';
import 'package:provider/provider.dart';
class Test extends StatefulWidget{
  String uid;
  String name;
  String photoURL;
  String email;
  Test({Key key, this.uid,this.name, this.photoURL, this.email}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}
class _TestState extends State<Test> {
  Widget build(BuildContext context) {

    List<Item> userList1 = Provider.of<List<Item>>(context);
    FirebaseService firebaseServices = FirebaseService();
    return (userList1 != null ) ?
      Consumer<Cart>(builder: (context, cart, child) {
        cart.addUser(widget.uid,widget.name, widget.photoURL, widget.email);
        List<Item> userList = [];
        List<int> chiso = [1,9,17,25,33,41,50,60];
        for (int i = 0; i<userList1.length;i++){
          for(int j = 0;j<8;j++){
            if(userList1[i].id == chiso[j]){
              userList.add(userList1[i]);
              break;
            }
          }
        }
        return Scaffold(
            appBar: AppBar(
              title: Text('Mat hang dac biet hom nay'),
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
            body: shopItemsListBuilder(userList,cart,this.widget.uid)
        );
      })
     :  Container(child: Text("Loading",textAlign: TextAlign.center,));


  }
}





Widget shopItemsListBuilder(List userList,Cart cart,String uid) {

  return GridView.builder(
    padding: EdgeInsets.all(7),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 1.1,
    ),
    itemCount: userList.length,
    itemBuilder: (_, i,) {
      return new Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.green[500])
          ),
          color: Colors.white,
          child: InkWell(
              onTap: () {
                cart.addInfoItem(userList[i]);
                Navigator.of(_).push(

                    MaterialPageRoute(builder: (context) => Detail()));

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
                                          fontSize: 17.0)),

                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child:Text("\$${userList[i].price}",
                                      style: TextStyle(
                                          color: Color(0xFFCC8053),
                                          fontFamily: 'Varela',
                                          fontSize: 16.0)),

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
                                            if (userList[i].isLike == true){
                                              //cart.removeFavorite(userList[i]);

                                              cart.deleteFavorite(cart.uid + userList[i].id.toString());
                                            }else{

                                              cart.createItemFavorite1(userList[i],cart.uid);
                                            }

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