import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProductPage extends StatefulWidget{
  _MyProductPageState createState() => new _MyProductPageState();
  // ghi de 1 doi tuong trang thai private

}

class _MyProductPageState extends State<MyProductPage>{
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("FreshFarm",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
    ),
    body:StreamBuilder<QuerySnapshot>(

      stream: Firestore.instance.collection('foodnames').snapshots(),

      builder: (context,snapshot){
        if(!snapshot.hasData) return LinearProgressIndicator();

      return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder :(context, index) =>

              _buildListItem(context,snapshot.data.documents[index])
      );


      }
    ));}}
Widget _buildListItem(BuildContext context, DocumentSnapshot document){
  return Row(
    children: <Widget>[
    Container(
        padding: EdgeInsets.only(top: 20,left: 40,right: 20,bottom: 10),
          child: Text(document['name'], style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black
          ),),


      ),
    Text(
      document['info'],style: TextStyle(
      fontSize: 13,color: Colors.blue
    ),
    ),


     Center(
       child: Container(
        padding: EdgeInsets.only(top: 20,right: 20,bottom: 10),
           child: Image.asset(
             document['image'],
             height: 80,
             width: 80,

           )),
     )
      ],
  );
}



