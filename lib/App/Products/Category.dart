

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fresh_farm/App/ListProduct/giavi.dart';
import 'package:fresh_farm/App/ListProduct/haisan.dart';
import 'package:fresh_farm/App/ListProduct/hoaqua.dart';
import 'package:fresh_farm/App/ListProduct/ngucoc.dart';
import 'package:fresh_farm/App/ListProduct/rau.dart';
import 'package:fresh_farm/App/ListProduct/thit.dart';
import 'package:fresh_farm/App/ListProduct/thucpham.dart';
import 'package:fresh_farm/App/ListProduct/trungsua.dart';
import 'FastFood.dart';
class MyCategoryPage extends StatefulWidget{
  _MyCategoryPageState createState() => new _MyCategoryPageState();
  String uid;
  MyCategoryPage({Key key, this.uid}) : super(key: key);
}
class _MyCategoryPageState extends State<MyCategoryPage>{
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0C9869),
        title: Text("Danh mục sản phẩm",
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
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Raucu(uid: widget.uid)));

            },
            child: Container(
                //color: Color(0xFFEFDB),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                  color: Color(0xFFEFDB)

                    ),
                child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 3),
                          height: size.height*0.3,
                          width: size.width*0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/nhan/raucu.jpg"),
                                  fit: BoxFit.fill)))),

                  Text('Rau củ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

        ]),
    ))),
        Padding(
            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Hoaqua(uid: widget.uid)));
                  },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top: 3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/hoaqua.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Hoa quả',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>Haisan(uid: widget.uid,)));

                },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top: 3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/haisan.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Hải sản',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>Thit(uid: widget.uid,)));

                },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top:3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/thit.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Thịt',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Ngucoc(uid: widget.uid,)));

                },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top: 3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/ngucoc.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Ngũ cốc',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Giavi(uid: widget.uid,)));

                },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top:3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/giavi.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Gia vị',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Thucpham(uid: widget.uid,)));

                },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top:3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/giocha.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Giò chả',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
        Padding(

            padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
            child: InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Trungsua(uid: widget.uid,)));

                },
                child: Container(
                  //color: Color(0xFFEFDB),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Color(0xFFEFDB)

                  ),
                  child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(top:3),
                                height: size.height*0.3,
                                width: size.width*0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/nhan/trungsua.jpg"),
                                        fit: BoxFit.fill)))),

                        Text('Trứng sữa',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Varela',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

                      ]),
                ))),
      ]));}}



