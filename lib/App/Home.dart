import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Products/Category.dart';
import 'package:fresh_farm/App/Products/Fruits.dart';
import 'package:fresh_farm/Login/Login.dart';
import 'package:fresh_farm/product.dart';

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
        backgroundColor: Colors.green,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyFruitsPage()));
                  },
                  child: Icon(
                    Icons.search,
                    size: 35.0,
                  ),
                )
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
              color: Colors.green,
            ),

          ),
          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProductPage()));
              },
              child: Icon(Icons.markunread_mailbox,size: 30,color: Colors.green),
            ),
            title: Text('Product',style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green
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
                color: Colors.green,
              ),
            ),
            title: Text('Favorite',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green
            )),
          ),
          ListTile(
            leading: GestureDetector(
              onTap:(){},
              child: Icon(Icons.shopping_cart,size: 30, color: Colors.green),
            ),
            title: Text('Cart',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green
            )),
          ),
          ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
              },
              child: Icon(Icons.exit_to_app,size: 30,color: Colors.green,),
            ),
            title: Text('Log Out',style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green
            )),
          ),
        ],
      ),
    ),
    body:Column(
    mainAxisAlignment:MainAxisAlignment.start,
    //
    children: <Widget>[]));}}