import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
class Rating1 extends StatefulWidget {
  @override
  _Rating1State createState() => _Rating1State();
}

class _Rating1State extends State<Rating1> {
  int id;
  String uid;
  double rating = 3.5;
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
                    child: new StarRating(
                      size: 25.0,
                      rating: rating,
                      color: Colors.orange,
                      borderColor: Colors.grey,
                      starCount: starCount,
                      onRatingChanged: (rating) => setState(
                            () {
                          this.rating = rating;
                        },
                      ),
                    ),
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

                      cart.createReview(cart.idRating, cart.uid, rating, text.text);
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