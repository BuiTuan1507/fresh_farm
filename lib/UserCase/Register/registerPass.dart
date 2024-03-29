import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerPop.dart';


class signUpPass extends StatefulWidget {
  String name;
  String email;
  String phone;
  signUpPass({Key key, this.name,this.email, this.phone}) : super(key: key);
  @override
  _signUpPassState createState() => _signUpPassState();
}

class _signUpPassState extends State<signUpPass> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();

  String pass;

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
        pass = passController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Mật khẩu'),
        backgroundColor: Color(0xFF0C9869),
        centerTitle: true,
      ),
      body: SignUpPassPage(context),
    );
  }

  Widget SignUpPassPage(context) {
    return new Form(
      key: _formKey,
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

  Widget _showText() {
    return new Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 0),
      child: Center(
        child: Text(
          'Chọn mật khẩu',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold

          ),
        ),
      ),

    );
  }

  Widget _showPasswordField() {
    return new Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: passController,
          decoration: InputDecoration(
              labelText: 'Mật Khẩu',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
          validator: (value) => value.isEmpty ? 'Mật khẩu không thể trống' : null,
          onSaved: (value) => pass = value.trim(),
        ));
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if (pass != null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => signUpPrivacy(name: widget.name,email: widget.email,phone:widget.phone,pass: pass,)));
        }
      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 0),
        height: 95.0,


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