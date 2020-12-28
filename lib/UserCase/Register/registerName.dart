import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerEmail.dart';


class signUpName extends StatefulWidget {
  @override
  _signUpNameState createState() => _signUpNameState();
}

class _signUpNameState extends State<signUpName> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();

  String name;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() {
    if (validateAndSave()) {
      setState(() {
        name = firstNameController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Tên'),
        centerTitle: true,
        backgroundColor: Color(0xFF0C9869),
      ),
      body: SignUpNamePage(context, _formKey, firstNameController),
    );
  }

  Widget SignUpNamePage(context, _formKey, firstNameController) {
    return new Column(
      children: <Widget>[
        _showTextName(),
        Form(
          key: _formKey,
          child: Row(
            children: <Widget>[

              _showFirstNameField(context, firstNameController)
            ],
          ),
        ),
        _showButton(context)
      ],
    );
  }

  Widget _showTextName() {
    return new Container(
      padding: EdgeInsets.only(top: 30, right: 0, left: 0),
      child: Text(
        'Bạn tên gì ?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold,
            color: Colors.black87
        ),
      ),
    );
  }

  Widget _showFirstNameField(context, firstNameController) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return new Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      width: width ,
      child: TextFormField(
        controller: firstNameController,
        decoration: InputDecoration(
            labelText: 'Tên của bạn',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        validator: (value) => value.isEmpty ? 'Tên không thể trống' : null,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if(name != null)
        {
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => signUpEmail(name: name,)));
        }

      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 80, bottom: 0),
        height: 125.0,

          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.greenAccent,
            color: Color(0xFF0C9869),


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
}