

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
  int ratingT = 3;
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

    return Scaffold(
        appBar: new AppBar(
          title: new Text("Đánh giá"),
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
        ),
        body:Consumer<Cart>(
            builder: (context,cart,child){
              String name = "";
              String photoURL = "";
              if (userList != null){
                for (int i =0; i<userList.length;i++){
                  if (cart.uid == userList[i].userID){
                    name = userList[i].name;
                    photoURL = userList[i].photoURL;
                  }
                }
              }

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
                        ratingT = rating.round();
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
                          labelText: 'Nhập đánh giá của bạn',

                        ),
                        validator: (value) => value.isEmpty ? 'Đánh giá không thể để trống' : null,
                        onSaved: (value) => text = value.trim() as TextEditingController ,

                      ),
                    ),


                  ),


                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green[500])),
                    onPressed: () {

                      cart.createReview(cart.idRating, cart.uid, ratingT, text.text,name,photoURL);
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Đánh giá thành công')));

                    },
                    child: Text('Thêm'),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                  )
                ],
              );

            }


        ));

  }
}