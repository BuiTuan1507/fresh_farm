

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/authentication.dart';

class Data123Page extends StatefulWidget {
  @override
  Data123PageState createState() => Data123PageState();
}

class Data123PageState extends State<Data123Page> {
  final _formKey = new GlobalKey<FormState>();

  int id;

  String name;
  String imgPath;
  int price = 40;
  int count = 1;
  int rating = 4;
  bool isLike = false;
  String _errorMessage;
  bool _isLoading;
  bool show;

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imgPathController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  TextEditingController countController = TextEditingController();

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
  void validateAndSubmit() {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
      show = false;
    });
    if (validateAndSave()) {
      String userId = "";


      id = int.parse(idController.text);
      imgPath = imgPathController.text;
      name = nameController.text;

      Firestore firestoreReview = Firestore.instance;

      firestoreReview.collection('shopItems').document(id.toString()).setData({
        "id":id,
        "name":name,
        "imgPath":imgPath,
        "price":price,
        "count":count,
        "isLike": false,
        "rating":rating
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
          title: Text("FreshFarm",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),

          ],
        ));
  }



  Widget _showForm() {
    return new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(

                padding: EdgeInsets.only(left: 16.0, right: 16, top: 5),
                child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[

                     showIdInput(),
                      //showPriceInput(),
                     // showRatingInput(),
                      showNameInput(),
                      showImageInput(),
                      showPrimaryButton(),

                      //  showErrorMessage(),
                    ],
                  ),
                ))
          ],
        ));
  }


  Widget showIdInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      child: new TextFormField(

        controller: idController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'id',

            icon: new Icon(
              Icons.mail,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => id = int.parse(value.trim()) ,
      ),
    );
  }

  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      child: new TextFormField(
        controller: nameController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'name',
            icon: new Icon(
              Icons.mail,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }

  Widget showImageInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      child: new TextFormField(
        controller: imgPathController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Iamge',
            icon: new Icon(
              Icons.mail,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => imgPath = value.trim(),
      ),
    );
  }

  Widget showPriceInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      child: new TextFormField(
        controller: priceController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'price',
            icon: new Icon(
              Icons.mail,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => price = value.trim() as int,
      ),
    );
  }


  Widget showRatingInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
      child: new TextFormField(
        controller: ratingController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'rating',
            icon: new Icon(
              Icons.people,
              color: Color(0xFF0C9869),
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => rating = value.trim() as int,
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


}