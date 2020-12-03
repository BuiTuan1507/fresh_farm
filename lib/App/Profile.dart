import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_farm/App/Home.dart';
import 'package:fresh_farm/UserCase/reset_password.dart';
import 'package:fresh_farm/UserCase/updateProfile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class MyProfilePage extends StatefulWidget{
  const MyProfilePage({Key key, this.uid, this.email, this.name}) : super(key: key);

  _MyProfilePageState createState() => new _MyProfilePageState();
  final String uid;
  final String name;
  final String email;

}

class _MyProfilePageState extends State<MyProfilePage>{
  String name;
  String email;
  String photoURL;
  File _image;
  String urlUser ;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }
  Future uploadPic(BuildContext context) async{
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);

    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then((value) => {
      urlUser = value.toString()
    });
    if (urlUser != null)
    {
      setState(() {
        print("Profile Picture uploaded");

        Firestore.instance.collection("User").document(widget.uid).updateData(
            {
              "name" : widget.name,
              "email":widget.email,
              "photoURL":urlUser
            }
        );
        print(1234);

        print(urlUser);
        print(widget.uid);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

  }

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return new Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
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
        stream: Firestore.instance.collection("User").document(widget.uid).snapshots(),
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
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 100),
                                  child: CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: new SizedBox(
                                        width: 120.0,
                                        height: 120.0,
                                        child: (_image!=null)?Image.file(
                                          _image,
                                          fit: BoxFit.fill,
                                        ):Image.network(
                                            snapshot.data['photoURL']
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60.0,left: 20),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      getImage();
                                    },
                                  ),
                                ),
                              ],
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
                            Icons.phone, size: 23, color: Color(0xFF0C9869),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            'Số điện thoại :', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                          ),
                          ),),
                        Container(
                          padding: EdgeInsets.only(right: 20, bottom: 10),
                          child: Text(
                              "091222212" , style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)
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
                                    Icons.home, size: 23, color:Color(0xFF0C9869) ,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    'Địa chỉ :', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87
                                  ),
                                  ),),
                                Container(
                                  padding: EdgeInsets.only(right: 0),

                                  child: Text(
                                      'NoWhere' , style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)
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
                                    Icons.monetization_on, size: 23, color: Color(0xFF0C9869),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    'Xu thưởng :', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87
                                  ),
                                  ),),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                      '200', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)
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
                        color: Color(0xFF0C9869),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => updateProfile(uid:widget.uid)));
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
                        color: Color(0xFF0C9869),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => resetPassword()));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: () {
                            uploadPic(context);
                          },

                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),

                      ],
                    )


                  ]);
            }));
  }

}


