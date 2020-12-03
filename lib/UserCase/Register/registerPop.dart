

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/login_signup_page.dart';
class signUpPrivacy extends StatefulWidget {
  String name;
  String email;
  String pass;
  String photoURL="assets/ramdom.jpg";

  signUpPrivacy({Key key, this.name,this.email,this.pass}) : super(key: key);
  @override
  _signUpPrivacyState createState() => _signUpPrivacyState();
}

class _signUpPrivacyState extends State<signUpPrivacy> {
  String errorMessage;
  bool showLogin = false;
  void validateAndSubmit() async {
    setState(() {
      errorMessage = "";

    });
    String userId = "";
    try {
      {
        FirebaseAuth auth = FirebaseAuth.instance;
        AuthResult result = await auth.createUserWithEmailAndPassword(
            email: widget.email, password: widget.pass);
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        userUpdateInfo.displayName = widget.name;

        await result.user.updateProfile(userUpdateInfo);
        await result.user.reload();

        FirebaseUser user = result.user;
        userId = user.uid;
        //User


        //widget.auth.sendEmailVerification();
        //_showVerifyEmailSentDialog();
        print('Signed up user: $userId');
      }


      if (userId.length > 0 && userId != null) {
        var firebaseUser = await FirebaseAuth.instance.currentUser();
        final firestoreInstance = Firestore.instance;
        firestoreInstance.collection("User").document(userId).setData(
            {
              "name": widget.name,
              "email": widget.email,
              "userID": userId,
              "photoURL": widget.photoURL
            }
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Bạn đã đăng ký thành công"),

                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        showLogin = true;
      } else {
        print("111");
      }
    } catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Lỗi"),
              content: Text(e.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Điều khoản',),
        centerTitle: true,
        backgroundColor: Color(0xFF0C9869),
      ),
      body: SignUpPage(context),
    );
  }

  Widget SignUpPage(context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _showText1(),
          _showText2(),
          _showButton(context),
          _showButtonLogin(context)
        ],


    );
  }

  Widget _showText1() {
    return new Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 0),
        child: Center(
          child: Text(
            'Hoàn tất đăng ký',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold

            ),
          ),
        ));
  }

  Widget _showText2() {

    return new Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 20),

      child: Text(
        'Khi bạn ấn nút đăng ký, bạn sẽ trở  tham gia sử dụng dịch vụ mua thực phẩm sạch ở nông trại xanh của chúng tôi',
        style: TextStyle(
            fontSize: 16
        ),
        textAlign: TextAlign.center,


      ),
    );
  }

  Widget _showButton(context) {
    return new Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 0),
      height: 95.0,
      child: GestureDetector(
        onTap: () {
          validateAndSubmit();
        },
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.greenAccent,
          color: Color(0xFF0C9869),
          elevation: 7.0,
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
    );
  }
  Widget _showButtonLogin(context) {
     return new Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 0),
      height: 85.0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginSignupPage()));
        },
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.greenAccent,
          color: Color(0xFF0C9869),
          elevation: 7.0,

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
    ) ;
  }
}
