import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Products/Category.dart';
import 'package:fresh_farm/App/Products/Fruits.dart';
import 'package:fresh_farm/Login/Login.dart';
import 'package:fresh_farm/product.dart';
import 'UI/constants.dart';
import 'UI/recommed.dart';
import 'UI/featurred_plants.dart';
import 'UI/header_with_seachbox.dart';
import 'UI/recomend_plants.dart';
import 'UI/title_with_more_bbtn.dart';
import 'Profile.dart';
class MyHomeAppPage extends StatefulWidget{
  _MyHomeAppPageState createState() => new _MyHomeAppPageState(); // ghi de 1 doi tuong trang thai private
}
class _MyHomeAppPageState extends State<MyHomeAppPage>{
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyFruitsPage()));
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
      child: ListView(
        children: <Widget>[

          UserAccountsDrawerHeader(

            accountName: new Text('Courage',style: TextStyle(fontWeight: FontWeight.bold,
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
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProductPage()));
              },
              child: Icon(Icons.markunread_mailbox,size: 30,color:Color(0xFF0C9869)),
            ),
            title: Text('Product',style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0C9869)
            ),),
          ),
          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCategoryPage()));
              },
              child: Icon(
                Icons.favorite,
                size: 30,
                color: Color(0xFF0C9869),
              ),
            ),
            title: Text('Favorite',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0C9869)
            )),
          ),
          ListTile(
            leading: GestureDetector(
              onTap:(){},
              child: Icon(Icons.shopping_cart,size: 30, color:Color(0xFF0C9869) ),
            ),
            title: Text('Cart',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color:Color(0xFF0C9869)
            )),
          ),
          ListTile(
            leading: GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProfilePage()));
              },
              child: Icon(Icons.person,size: 30, color:Color(0xFF0C9869) ),
            ),
            title: Text('Profile',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color:Color(0xFF0C9869)
            )),
          ),
          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
              },
              child: Icon(Icons.exit_to_app,size: 30,color: Color(0xFF0C9869),),
            ),
            title: Text('Log Out',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0C9869)
            )),
          ),
        ],
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          FeaturedPlants(),
          TitleWithMoreBtn(title: "Category", press: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyCategoryPage()));
          }),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Recomended", press: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProductPage()));
          }),
          Recomends(),

          SizedBox(height: kDefaultPadding),
        ],
      ),


    ));}}