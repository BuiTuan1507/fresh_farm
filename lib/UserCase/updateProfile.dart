

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commons/commons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class updateProfile extends StatefulWidget {
  @override
  _updateProfileState createState() => _updateProfileState();
  final String uid;

  const updateProfile({Key key, this.uid}) : super(key: key);
}

class _updateProfileState extends State<updateProfile> {
  final _formKey = new GlobalKey<FormState>();
  String email;
  String name;
  String phone;
  String _errorMessage;
  bool _isLoading;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
      String userId = widget.uid;

      try {

      if (userId.length > 0 && userId != null) {
        var firebaseUser = await FirebaseAuth.instance.currentUser();
        final firestoreInstance = Firestore.instance;
        firestoreInstance.collection("User").document(userId).updateData(
            {
              "name" : name,
              "email":email,
              "phone":phone
            }
        );
        print(name);
        print(phone);
        print(email);
        phoneController.clear();
        emailController.clear();
        nameController.clear();
        showDialog();
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
          title: Text("Cập nhật thông tin",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
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

            Container(

                padding: EdgeInsets.all(16.0),
                child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      showLogin(),
                      showEmailInput(),
                      showNameInput(),
                      showImageInput(),
                      showPrimaryButton(),
                      showErrorMessage(),
                    ],
                  ),
                ))
          ],
        ));

  }
  Widget showLogin(){
    return new Container(
        padding: EdgeInsets.only(top:20,bottom: 20),
        child:Center(
          child:  Text(
            'Cập nhật thông tin cá nhân', style: TextStyle(
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

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        controller: emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email không thể để trống' : null,
        onSaved: (value) => email = value.trim(),
      ),
    );
  }



  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        controller: nameController,
        maxLines: 1,

        decoration: new InputDecoration(
            hintText: 'Tên',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Tên không thể để trống' : null,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }
  Widget showImageInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        controller: phoneController,
        maxLines: 1,

        decoration: new InputDecoration(
            hintText: 'Số điện thoại',
            icon: new Icon(
              Icons.phone,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Số điện thoại không thể trống' : null,
        onSaved: (value) => phone = value.trim(),
      ),
    );
  }
  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: SizedBox(
          height: 50.0,
          child: new RaisedButton(

            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0)),
            color: Color(0xFF0C9869),
            child: new Text('Cập nhật thông tin',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit



           ,
          ),
        ));
  }
  Widget showDialog(){
    return successDialog(
      context,
      "Sửa thông tin thành công",

      positiveAction: () {

      },
    );
  }


}
