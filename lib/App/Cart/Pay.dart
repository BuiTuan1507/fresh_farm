import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {

  bool _checked = false;
  int _pay ;
  int _time;
  int _value = 1;

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
                  Center(
                    child:
                      Text('Chon phuong thuc thanh toan',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

                  ),
                  Column(
                    children: <Widget>[
                      RadioListTile(
                        title: Text('Thanh toan bang tien mat'),
                        value: 1,
                        groupValue: _pay,
                        onChanged: (value){setState(() {
                          _pay =  value;
                        });},
                      ),
                      RadioListTile(
                        title: Text('Thanh toan online'),
                        value: 0,
                        groupValue: _pay,
                        onChanged: (value){setState(() {
                          _pay =  value;
                        });},
                      )
                    ],
                  ),
                  Container(
                    padding:EdgeInsets.only(top: 10),
                      child:
                      Text('Chon thoi gian giao hang',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

                  ),
                  Column(
                    children: <Widget>[
                      RadioListTile(
                        title: Text('Nhanh(1-2h)'),
                        value: 1,
                        groupValue: _time,
                        onChanged: (value){setState(() {
                          _time =  value;
                        });},
                      ),
                      RadioListTile(
                        title: Text('Cham(3-4h)'),
                        value: 0,
                        groupValue: _time,
                        onChanged: (value){setState(() {
                          _time =  value;
                        });},
                      )
                    ],
                  ),
                  Container(
                      padding:EdgeInsets.only(top: 10),
                      child:
                      Text('Dia chi cua ban',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

                  ),
                  DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Hoàng Mai"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Hai Bà Trưng"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                            child: Text("Hoài Kiếm"),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text("Ba Đình"),
                            value: 4
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                  DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Hoàng Mai"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Hai Bà Trưng"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                            child: Text("Hoài Kiếm"),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text("Ba Đình"),
                            value: 4
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),

                ],
              );}
    ));
  }
}
