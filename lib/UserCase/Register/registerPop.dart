import 'package:flutter/material.dart';
class signUpPrivacy extends StatefulWidget {
  @override
  _signUpPrivacyState createState() => _signUpPrivacyState();
}

class _signUpPrivacyState extends State<signUpPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Điều khoản',),
        centerTitle: true,
      ),
      body: SignUpPage(context),
    );
  }
}
Widget SignUpPage(context){
  return new SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _showText1(),
        _showText2(),
        _showButton(context)
      ],

    ),
  );
}
Widget _showText1(){
  return new Container(
      padding:  EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 0),
      child: Center(
        child:Text(
          'Hoàn tất đăng ký',
          style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold

          ),
        ),
      ));
}
Widget _showText2(){
  return new Container(
    padding: EdgeInsets.only(right: 20,left: 20,top: 20),

    child: Text(
     '',
      style: TextStyle(
          fontSize: 16
      ),
      textAlign: TextAlign.center,


    ),
  );
}
Widget _showButton(context){
  return new Container(
    padding: EdgeInsets.only(right: 20, left: 20, top:30, bottom: 0),
    height: 70.0,
    child: Material(
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.blueAccent,
      color: Colors.blue,
      elevation: 7.0,
      child: GestureDetector(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));

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
  );
}

