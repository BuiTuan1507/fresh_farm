import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
class Rating1 extends StatefulWidget {
  @override
  _Rating1State createState() => _Rating1State();
}

class _Rating1State extends State<Rating1> {
  int id;
  String uid;
  int rating = 3;
  int starCount = 5;
  TextEditingController text = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool _validate = false;
  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<User> userList = Provider.of<List<User>>(context);
    String name = "";
    String photoURL = "";
    for (int i =0; i<userList.length;i++){
      if (uid == userList[i].uid){
        name = userList[i].name;
        photoURL = userList[i].photoURL;
      }
    }
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Star Rating"),
        ),
        body:Consumer<Cart>(
            builder: (context,cart,child){

              return new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(
                      top: 20.0,
                      bottom: 30.0,
                    ),
                    child: new RatingBar(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ),

                  Container(

                    height: 100,
                    padding: EdgeInsets.only(left: 20,right: 10,top: 20,bottom: 20),
                    child: new Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: text,
                        keyboardType: TextInputType.multiline,
                        minLines: 1, maxLines: 4,

                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Enter the Value',

                        ),
                        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                        onSaved: (value) => text = value.trim() as TextEditingController ,

                      ),
                    ),


                  ),


                  RaisedButton(
                    onPressed: () {

                      cart.createReview(cart.idRating, cart.uid, rating, text.text,name,photoURL);
                    },
                    child: Text('Submit'),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                  )
                ],
              );

            }


        ));

  }
}