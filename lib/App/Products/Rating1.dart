import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
class Rating1 extends StatefulWidget {
  @override
  _Rating1State createState() => _Rating1State();
}

class _Rating1State extends State<Rating1> {

  double rating = 3.5;
  int starCount = 5;
  final _text = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text("Star Rating"),
        ),
        body:
        new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(
                top: 50.0,
                bottom: 50.0,
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
            new Text(
              "Your rating is: $rating",
              style: new TextStyle(fontSize: 30.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Error Showed if Field is Empty on Submit button Pressed'),
                TextField(
                  controller: _text,
                  decoration: InputDecoration(
                    labelText: 'Enter the Value',
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _text.text.isEmpty ? _validate = true : _validate = false;
                    });
                  },
                  child: Text('Submit'),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ],
        ),
      );
  }
}
