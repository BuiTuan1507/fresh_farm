import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerEmail.dart';


class signUpName extends StatefulWidget {
  @override
  _signUpNameState createState() => _signUpNameState();
}

class _signUpNameState extends State<signUpName> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Tên'),
        centerTitle:true ,
      ),
      body: SignUpNamePage(context),
    );
  }
}
Widget SignUpNamePage(context){
  return new Column(
    children: <Widget>[
      _showTextName(),
      Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _showFirstNameField(context)
            ],
          ),
          Column(
            children: <Widget>[
              _showLastNameField(context)
            ],
          ),

        ],
      ),
      _showButton(context)
    ],
  );
}
Widget _showTextName(){
  return new  Container(
    padding: EdgeInsets.only(top: 30,right: 0,left: 0),
    child: Text(
      'Bạn tên gì',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold,
          color: Colors.black87
      ),
    ),
  );
}
Widget _showFirstNameField(context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return new  Container(
    padding: EdgeInsets.only(left: 20,right: 20,top: 10),
    width: width*0.5,
    child: TextField(

      decoration: InputDecoration(
          labelText: 'HỌ',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    ),
  );
}
Widget _showLastNameField(context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return new Container(
    padding: EdgeInsets.only(left: 20,right: 20, top: 10),
    width: width * 0.5,
    child: TextField(
      decoration: InputDecoration(
          labelText: 'TÊN',
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    ),

  );
}
Widget _showButton(context){
  return new  Container(
    padding: EdgeInsets.only(right: 20, left: 20, top: 120, bottom: 0),
    height: 160.0,
    child: Material(
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.blueAccent,
      color: Colors.blue,
      elevation: 7.0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => signUpPhone()));

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
