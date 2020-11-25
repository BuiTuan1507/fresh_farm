import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Home.dart';
import 'package:fresh_farm/App/Model/authentication.dart';
import 'package:fresh_farm/UserCase/login_signup_page.dart';
class forgetPassword extends StatefulWidget {
  const forgetPassword({Key key, this.auth}) : super(key: key);

  @override
  _forgetPasswordState createState() => _forgetPasswordState();
  final BaseAuth auth;
}

class _forgetPasswordState extends State<forgetPassword> {
  final _formKey = new GlobalKey<FormState>();
  String email;
  String _errorMessage;
  bool _isLoading;
  TextEditingController passwordController = TextEditingController();
  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = false;
    });
    if (validateAndSave()) {
      String email = "";

      try {
        {
          email = passwordController.text;
          await widget.auth.resetPassword(email);
        }
        setState(() {
          _isLoading = false;
        });


      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
          title: Text("Thiết lập lại mật khẩu",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
            _showCircularProgress(),
          ],
        ));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }


  Widget _showForm() {
    return new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16.0),
                child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      showLogin(),

                      showPasswordInput(),
                      showPrimaryButton(),
                      showSecondaryButton(),
                      showErrorMessage(),
                    ],
                  ),
                ))
          ],
        ));

  }
  Widget showLogin(){
    return new Container(
        padding: EdgeInsets.only(top:10,bottom: 15),
        child:Center(
          child:  Text(
            'Nhập email', style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87
          ),
          ),
        )

    );
  }
  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nhập email của bạn',
            icon: new Icon(
              Icons.mail,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Email không thể để trống' : null,
        onSaved: (value) => email = value.trim(),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new Container(
      padding: EdgeInsets.only(top: 20),
      child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginSignupPage()));
          },
          child: new Center(
            child:  Text(
                'Quay về trang đăng nhập' ,
                style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color:Color(0xFF0C9869))),
          )

      ),
    );

  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: SizedBox(
          height: 45.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xFF0C9869),
            child: new Text('Đổi mật khẩu',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: (passwordController.text != null ) ? validateAndSubmit : null,
          ),
        ));
  }
}

