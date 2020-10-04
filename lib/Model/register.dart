import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = new GlobalKey<FormState>();

  String email;
  String password;
  String name;
  String photoURL;
  String _errorMessage;
  bool _isLoading;
  bool show;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController photoURLController = TextEditingController();

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
      show = false;
    });
    if (validateAndSave()) {
      String userId = "";

      try {{
        email = emailController.text;
        password =passwordController.text;
        name = nameController.text;
        photoURL = photoURLController.text;
        FirebaseAuth auth = FirebaseAuth.instance;


        AuthResult result = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        userUpdateInfo.displayName = name;

        await result.user.updateProfile(userUpdateInfo);
        await result.user.reload();

        FirebaseUser user = result.user;
        userId = user.uid;
        //User
        




          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          var firebaseUser = await FirebaseAuth.instance.currentUser();
          final firestoreInstance = Firestore.instance;
          firestoreInstance.collection("User").document(userId).setData(
              {
                "name" : name,
                "email":email,
                "userID": userId,
                "photoURL":photoURL
              }
          );
        }else{
          print ("111");
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
          title: Text("FreshFarm",
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

//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content:
//              new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                toggleFormMode();
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

  Widget _showForm() {
    return new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showLogo(),
            Container(

                padding: EdgeInsets.only(left:16.0,right: 16,top: 5),
                child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      showLogin(),
                      showText(),
                      showEmailInput(),
                      showPasswordInput(),
                      showNameInput(),
                      showImageInput(),
                      showPrimaryButton(),
                      primaryButton(),
                      showErrorMessage(),
                    ],
                  ),
                ))
          ],
        ));

  }
  Widget showLogin(){
    return new Container(
        padding: EdgeInsets.only(top:15,bottom: 0, left: 15),
        child:Center(
          child:  Text(
            'Chào mừng bạn đến với nông trại ', style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87
          ),

          ),
        )

    );
  }
  Widget showText(){
    return new Container(
        padding: EdgeInsets.only(top:5,bottom: 5, left: 15),
        child:Center(
          child:  Text(
            'xanh của chúng tôi', style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87
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
          padding: EdgeInsets.only(top: 15),
            height: size.height * 0.2,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Image.asset(
                "assets/farm.jpg",
                width: size.width ,
              ),
            ))
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      child: new TextFormField(
        controller: emailController,
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
        onSaved: (value) => email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
      child: new TextFormField(
        controller: passwordController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => password = value.trim(),
      ),
    );
  }
  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
      child: new TextFormField(
        controller: nameController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Name',
            icon: new Icon(
              Icons.people,
              color:Color(0xFF0C9869) ,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }
  Widget showImageInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
      child: new TextFormField(
        controller: photoURLController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Phone',
            icon: new Icon(
              Icons.phone,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => photoURL = value.trim(),
      ),
    );
  }


  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(3.0, 30.0, 3.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xFF0C9869),
            child: new Text('Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }
  Widget primaryButton(){
    return new Container(
      padding: EdgeInsets.only(top:8),
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Center(
          child:  Text(
              'Đã có tài khoản',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF0C9869)),
          ),
        )

      ),
    );
  }
}
