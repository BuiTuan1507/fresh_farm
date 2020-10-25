import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/ListProduct/giavi.dart';
import 'package:fresh_farm/App/ListProduct/hoaqua.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';



import 'package:fresh_farm/App/Products/Category.dart';
import 'package:fresh_farm/App/Products/Search.dart';
import 'package:fresh_farm/App/Model/authentication.dart';
import 'package:fresh_farm/App/Cart/Notification.dart';

import 'package:fresh_farm/App/Products/productRecommed.dart';
import 'package:fresh_farm/addData.dart';
import 'package:provider/provider.dart';
import 'Cart/shopping_cart.dart';
import 'Favorite.dart';
import 'HomeComponent/constants.dart';
import 'HomeComponent/recommed.dart';
import 'HomeComponent/featurred_plants.dart';
import 'HomeComponent/header_with_seachbox.dart';
import 'HomeComponent/recomend_plants.dart';
import 'HomeComponent/title_with_more_bbtn.dart';
import 'Profile.dart';

import 'package:firebase_database/firebase_database.dart';

import 'dart:async';
class MyHomeAppPage extends StatefulWidget{
  _MyHomeAppPageState createState() => new _MyHomeAppPageState();
  // ghi de 1 doi tuong trang thai private
  MyHomeAppPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
}
class _MyHomeAppPageState extends State<MyHomeAppPage>{

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }


  Widget buildDrawer(BuildContext context){
    List<Item> userList = Provider.of<List<Item>>(context);
    return new ListView(
      children: <Widget>[

        UserAccountsDrawerHeader(

          accountName:new Text('Courage',style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 28),
          ),
          accountEmail: new Text('courage@gmail.com',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16),),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.jpg"),

          ),
          decoration: BoxDecoration(
            color: Color(0xFF0C9869),
          ),

        ),
        ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Test(uid: widget.userId)));
            },
            child: Icon(Icons.markunread_mailbox,size: 26,color:Color(0xFF0C9869)),
          ),
          title: Text('Product',style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45
          ),),
        ),
        ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Favorite1(uid: widget.userId)));
            },
            child: Icon(
              Icons.favorite,
              size: 26,
              color: Color(0xFF0C9869),
            ),
          ),
          title: Text('Favorite',style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black45
          )),
        ),
        ListTile(
          leading: GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Checkout()));
            },
            child: Icon(Icons.shopping_cart,size: 26, color:Color(0xFF0C9869) ),
          ),
          title: Text('Cart',style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black45
          )),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text('Products',style: TextStyle(fontSize: 16,),),
        )
        ,
        ListTile(
          leading: GestureDetector(
            onTap:(){

              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProfilePage(uid: widget.userId)));
            },
            child: Icon(Icons.person,size: 26, color:Color(0xFF0C9869) ),
          ),
          title: Text('Profile',style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black45
          )),
        ),
        ListTile(
          leading: GestureDetector(
            onTap:(){

              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CloudFirestoreSearch()));
            },
            child: Icon(Icons.search,size: 26, color:Color(0xFF0C9869) ),
          ),
          title: Text('Search',style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black45
          )),
        ),
        ListTile(
          leading: GestureDetector(
            onTap: (){

            },
            child: Icon(Icons.chat,size: 26,),
          ),
          title: Text('Help', style:  TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold
          ),),
        ),
        ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Sale()));
            },
            child: Icon(Icons.add_alert,size: 26,),
          ),
          title: Text('Notification', style:  TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold
          ),),
        ),
        ListTile(
          leading: GestureDetector(
            onTap: (){
              signOut();
            },
            //onPressed: signOut,
            child: Icon(Icons.exit_to_app,size: 26,color: Color(0xFF0C9869),),
          ),
          title: Text('Log Out',style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black45
          )),
        ),
        //Text("Product")
      ],
    );
  }
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Color(0xFF0C9869) ,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>Checkout()));


                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                ),
              ),

            ),

          ],

        ),
        drawer: new Drawer(
          child: buildDrawer(context)
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderWithSearchBox(size: size),
              FeaturedPlants(),
              TitleWithMoreBtn(title: "Category", press: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCategoryPage(uid:widget.userId)));
              }),
              RecomendsPlants(),
              TitleWithMoreBtn(title: "Recomended", press: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomeAppPage()));
              }),
              Recomend(),

              SizedBox(height: kDefaultPadding),
        ])));
  }

}
