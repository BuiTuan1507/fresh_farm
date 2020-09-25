
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/product.dart';
import 'signIn.dart';
class MyHomePage extends StatefulWidget{
  _MyHomePageState createState() => new _MyHomePageState(); // ghi de 1 doi tuong trang thai private
}
class _MyHomePageState extends State<MyHomePage>{
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
        body:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            //
            children: <Widget>[

              Container(
            height: size.height*0.3,
            width: double.infinity,
            color: Colors.green,

            child:    Center(

                  child: Image.asset(
                    "assets/farm.jpg",
                    width: size.width*0.65,

                  ),
                ))
              ,
              Padding(
                padding: EdgeInsets.only(top:10),
                child:Center(

                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              ),



              Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child:SingleChildScrollView(
                    child:  Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: Colors.green,),
                              border: OutlineInputBorder(),


                              labelText: 'Email ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),

                        ),SizedBox(height: size.height*0.03),

                      ]))),
                Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child:SingleChildScrollView(
                    child:  Column(
                      children: <Widget>[
                        TextField(

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
                        SizedBox(height: size.height*0.03),
                      ]))),




                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 10.0, left: 20.0),
                  child: InkWell(
                    child: Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProductPage()));
                      },
                      child: Center(
                        child: Text(
                          'Đăng nhập',
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
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Chưa có tài khoản ?',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MySignInPage()));
                },
                child: Text(
                  'Đăng ký',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )

    ])
    );
  }
}
Widget buildTextLog(BuildContext context){
  return Material(
    child: SingleChildScrollView(
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person, color: Colors.green,),
            border: OutlineInputBorder(),


            labelText: 'Email ',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),

      ),

    ),
  );
}
