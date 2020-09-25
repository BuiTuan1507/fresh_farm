import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Profile.dart';
class MySignInPage extends StatefulWidget{
  _MySignInPageState createState() => new _MySignInPageState(); // ghi de 1 doi tuong trang thai private
}
class _MySignInPageState extends State<MySignInPage>{
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Đăng ký",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

    ),
    body:Column(
    mainAxisAlignment:MainAxisAlignment.start,
    //
    children: <Widget>[
      Container(
          height: size.height*0.24,
          width: double.infinity,
          color: Colors.green,

          child:    Center(

            child: Image.asset(
              "assets/food.jpg",
              width: size.width*0.75,

            ),
          ))
      ,
      Center(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 15,right: 15, bottom: 10),
            child: Text(
              'Chào mừng bạn đến với nông trại xanh của chúng tôi',
              style: TextStyle(
                  fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
            )
        )

        ),

      Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              child:SingleChildScrollView(
                  child:  Column(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                            height: 0.7
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: Colors.green,),
                              border: OutlineInputBorder(),


                              labelText: 'Ho',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),SizedBox(height: size.height*0.02),

                      ]))),
          Padding(
              padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              child:SingleChildScrollView(
                  child:  Column(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                              height: 0.7
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.near_me, color: Colors.green,),
                              border: OutlineInputBorder(),


                              labelText: 'Ten',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),SizedBox(height: size.height*0.02),

                      ]))),
          Padding(
              padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              child:SingleChildScrollView(
                  child:  Column(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                              height: 0.7
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: Colors.green,),
                              border: OutlineInputBorder(),


                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),SizedBox(height: size.height*0.02),

                      ]))),
          Padding(
              padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0, bottom: 12),
              child:SingleChildScrollView(
                  child:  Column(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                              height: 0.7
                          ),

                          decoration: InputDecoration(

                              prefixIcon: Icon(Icons.lock_open,color: Colors.green,),
                              //border: InputBorder.none,
                              border: OutlineInputBorder(),
                              labelText: 'Mật khẩu',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: size.height*0.02),
                      ]))),
        ],
      ),
      Container(
        padding: EdgeInsets.only(top: 5,left: 20,right: 20, bottom: 5),
        height: 50,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blueAccent,
          color: Colors.green,
          elevation: 7.0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProfilePage()));
            },
            child: Center(
              child: Text(
                'Đăng ký',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 10,),
      Center(

         child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Đã có tài khoản',
              style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
          )

      )
    ]));}}