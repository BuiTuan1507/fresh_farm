import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_farm/App/Home.dart';

class MyProfilePage extends StatefulWidget{
  const MyProfilePage({Key key, this.uid}) : super(key: key);

  _MyProfilePageState createState() => new _MyProfilePageState();
  final String uid;

}

class _MyProfilePageState extends State<MyProfilePage>{
  String name;
  String email;
  String photoURL;
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    CollectionReference users = Firestore.instance.collection('User');
    return new Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("Thông tin cá nhân",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomeAppPage()));
                  },
                  child: Icon(
                    Icons.home,
                    size: 35.0,
                  ),
                )
            ),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection("User").document("0oULJrkVt3bTsqetIYgTY75ucP03").snapshots(),
            builder: (context,snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return new Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  //
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 0, left: 15, right: 15),
                        height: size.height * 0.35,
                        width: double.infinity,
                        color: Colors.white30,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                color: Colors.white30,
                                height: size.height * 0.25,
                                width: size.width * 0.35,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            "assets/avatar.jpg")
                                    ),
                                  ),
                                ),

                              ),
                            ),
                            Center(
                              child: Text(
                                snapshot.data['name'], style: TextStyle(fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                              ),
                            ),
                            Center(
                              child: Text(
                                snapshot.data['email'],
                                style: TextStyle(fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black45),
                              ),
                            )
                          ],
                        )


                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 40, right: 15, bottom: 10),
                          child: Icon(
                            Icons.phone, size: 23, color: Colors.green,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            'Số điện thoại :', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                          ),
                          ),),
                        Container(
                          padding: EdgeInsets.only(right: 20, bottom: 10),
                          child: Text(
                              snapshot.data['photoURL'] , style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 12, bottom: 10,),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 40, right: 15),
                                  child: Icon(
                                    Icons.home, size: 23, color: Colors.green,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    'Địa chỉ :', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green
                                  ),
                                  ),),
                                Container(
                                  padding: EdgeInsets.only(right: 0),

                                  child: Text(
                                      'address' , style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 12, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 40, right: 15),
                                  child: Icon(
                                    Icons.monetization_on, size: 23, color: Colors
                                      .green,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    'Xu thưởng :', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green
                                  ),
                                  ),),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                      'money', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.only(
                          top: 30, left: 40, right: 40, bottom: 5),
                      height: 75,

                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProfilePage()));
                          },
                          child: Center(
                            child: Text(
                              'Cập nhật thông tin cá nhân',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 40, right: 40, bottom: 5),
                      height: 50,

                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProfilePage()));
                          },
                          child: Center(
                            child: Text(
                              'Đổi mật khẩu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),


                  ]);
            }));
  }}
