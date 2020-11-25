import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerPass.dart';


class signUpEmail extends StatefulWidget {
  String name;
  signUpEmail({Key key, this.name}) : super(key: key);
  @override
  _signUpEmailState createState() => _signUpEmailState();
}

class _signUpEmailState extends State<signUpEmail> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  String email;

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
        email = emailController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Email',),
        centerTitle: true,
        backgroundColor: Color(0xFF0C9869),
      ),
      body: SignUpEmailPage(context, emailController),
    );
  }

  Widget SignUpEmailPage(context, emailController) {
    return new Form(
      key: _formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _showText(),
          _showPhoneField(emailController),
          _showButton(context)
        ],
      ),
    );

  }

  Widget _showText() {
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

  Widget _showPhoneField(emailController) {
    return new Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              labelText: 'Email của bạn',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
          validator: (value) => value.isEmpty ? 'Email không thể trống' : null,
          onSaved: (value) => email = value.trim(),
        ));
  }

  Widget _showButton(context) {
    return new Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 0),
      height: 95.0,
      child: GestureDetector(
        onTap: () {
          validateAndSubmit();
          if(email !=null)
          {
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => signUpPass(name: widget.name,email: email,)));
          }

        },
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.greenAccent,
          color: Color(0xFF0C9869),
          elevation: 7.0,

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