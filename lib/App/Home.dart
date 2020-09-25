import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    ),
    drawer: new Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text('Courage',style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 26),
            ),
            accountEmail: new Text('courage@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.markunread_mailbox),
            title: Text('Product'),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
          ),
        ],
      ),
    ),
    body:Column(
    mainAxisAlignment:MainAxisAlignment.start,
    //
    children: <Widget>[]));}}