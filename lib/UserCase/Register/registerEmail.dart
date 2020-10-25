import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerPass.dart';


class signUpPhone extends StatefulWidget {
  @override
  _signUpPhoneState createState() => _signUpPhoneState();
}

class _signUpPhoneState extends State<signUpPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Email',),
        centerTitle: true,
      ),
      body: SignUpPhonePage(context),
    );
  }
}
Widget SignUpPhonePage(context){
  return new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _showText(),
      _showPhoneField(),
      _showButton(context)
    ],
  );
}
Widget _showText(){
  return new Container(
    padding: EdgeInsets.only(top: 50, left: 0, right: 0),
    child: Center(
      child: Text(
        'Nhập Email của bạn',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
Widget _showPhoneField(){
  return new Container(
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Số di động',
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
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => signUpPass()));

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

