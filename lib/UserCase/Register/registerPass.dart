import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class signUpPass extends StatefulWidget {
  @override
  _signUpPassState createState() => _signUpPassState();
}

class _signUpPassState extends State<signUpPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Mật khẩu'),

        centerTitle: true,
      ),
      body: SignUpPassPage(context),
    );
  }
}
Widget SignUpPassPage(context){
  return new SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _showText(),
        _showPasswordField(),
        _showButton(context)
      ],

    ),
  );
}
Widget _showText(){
  return new Container(
    padding:  EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 0),
    child: Center(
      child:Text(
        'Chọn mật khẩu',
        style: TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold

        ),
      ),
    ),

  );
}
Widget _showPasswordField(){
  return new Container(
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child:TextField(
        decoration: InputDecoration(
            labelText: 'Mật Khẩu',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
      ));
}
Widget _showButton(context){
  return new Container(
    padding: EdgeInsets.only(right: 20, left: 20, top: 120, bottom: 0),
    height: 160.0,
    child: Material(
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.blueAccent,
      color: Colors.blue,
      elevation: 7.0,
      child: GestureDetector(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => signUpPrivacy()));

        },
        child: Center(
          child: Text(
            'Tiếp',
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