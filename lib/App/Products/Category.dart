import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FastFood.dart';
import 'flower.dart';
import 'Fruits.dart';
import 'meatAndEgg.dart';
import 'milk.dart';
import 'TeaAndCoffee.dart';
import 'vegetable.dart';
import 'Wheat.dart';
class MyCategoryPage extends StatefulWidget{
  _MyCategoryPageState createState() => new _MyCategoryPageState(); // ghi de 1 doi tuong trang thai private
}
class _MyCategoryPageState extends State<MyCategoryPage>{
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Danh muc",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
    ),
    body:  GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 1.1,
      children: <Widget>[
        Padding(

        padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
        child: InkWell(

            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyFruitsPage()));

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
                        child: Container(

                          height: size.height*0.3,
                          width: size.width*0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/1.jpg"),
                                  fit: BoxFit.fill)))),

                  Text('thit',
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 18.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

        ]),
    ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyVegetablePage()));

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyWheatPage()));

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyMeatPage()));

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyTeaPage()));

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyMilkPage()));

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyFlowerPage()));

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
                            child: Container(

                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/1.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('thit',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 18.0)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
      ]));}}



