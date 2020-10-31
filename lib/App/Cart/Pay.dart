import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {

  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
          title: Text("Thanh Toan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

        ),
        body: Consumer<Cart>(
            builder: (context, cart,child) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Chon phuong thuc thanh toan')
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        child: CheckboxListTile(
                          title: Text('Thanh toan bang tien mat'),
                          secondary: Icon(Icons.payment),
                          controlAffinity: ListTileControlAffinity.platform,
                          value: _checked,
                          onChanged: (bool value){
                            setState(() {
                              _checked = value;
                            });
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.black,
                        ),


                      ),SizedBox(width: 30, height: 30,)
                    ],
                  )
                ]);



            })
    );
  }
}
