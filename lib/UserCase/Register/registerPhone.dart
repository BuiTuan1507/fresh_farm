import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/registerPass.dart';


class signUpPhone extends StatefulWidget {
  String name;
  String email;
  signUpPhone({Key key, this.name, this.email}) : super(key: key);
  @override
  _signUpPhoneState createState() => _signUpPhoneState();
}

class _signUpPhoneState extends State<signUpPhone> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String phone;

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
        phone = phoneController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Phone',),
        centerTitle: true,
        backgroundColor: Color(0xFF0C9869),
      ),
      body: SignUpPhonePage(context, phoneController),
    );
  }

  Widget SignUpPhonePage(context, phoneController) {
    return new Form(
      key: _formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _showText(),
          _showPhoneField(phoneController),
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
          'Nhập Số điện thoại của bạn',
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
              labelText: 'Số điện thoại của bạn',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
          validator: (value) => value.isEmpty ? 'Số điện thoại không thể trống' : null,
          onSaved: (value) => phone = value.trim(),
        ));
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if(phone !=null)
        {
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => signUpPass(name: widget.name,email: widget.email,phone: phone,)));
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