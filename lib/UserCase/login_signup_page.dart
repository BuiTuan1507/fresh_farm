

import 'package:flutter/material.dart';
import 'package:fresh_farm/UserCase/Register/register1.dart';
import 'package:fresh_farm/UserCase/register.dart';
import 'package:fresh_farm/App/Model/authentication.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

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
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      String name = "1";
      String email = "";
      String photoURL = "";
      try {
        {
          userId = await widget.auth.signIn(_email, _password);
          name = await widget.auth.getEmail();
          email = await widget.auth.getName();
          photoURL = await widget.auth.getPhotoURL();


          print ("chay di:$name");
          print('Signed in: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.loginCallback();
        }
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
    _isLoginForm = true;
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
          title: Text("Nông Trại Xanh",
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

 void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _showForm() {
    return new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showLogo(),
            Container(
                padding: EdgeInsets.all(16.0),
                child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      showLogin(),
                      showEmailInput(),
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
            'Đăng Nhập', style: TextStyle(
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

  Widget showLogo() {
    Size size = MediaQuery
        .of(context)
        .size;
    return new Hero(
        tag: 'hero',
        child:  Container(
            height: size.height * 0.3,
            width: double.infinity,
            color: Color(0xFF0C9869),
            child: Center(
              child: Image.asset("assets/farm.jpg",
                width: size.width ,
              ),
            ))
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Mật khẩu',
            icon: new Icon(
              Icons.lock,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
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
                MaterialPageRoute(builder: (context) =>signUp()));
          },
          child: new Center(
              child:  Text(
                  'Tạo tài khoản mới' ,
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
            child: new Text('Đăng nhập',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }
}