

import 'package:commons/commons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/OrderSuccess.dart';

import 'package:fresh_farm/App/Cart/TabBarCart.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';

import 'package:provider/provider.dart';
class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
  int ramdomNumber;
  Pay({Key key, this.ramdomNumber}) : super(key: key);
}

class _PayState extends State<Pay> {
  final _formKey = new GlobalKey<FormState>();
  String address;
  bool _checked = false;
  int _pay ;
  int _time;
  String _value = "Hoang Mai";
  String _quan = "Mai Dong";

  TextEditingController addressController = TextEditingController();
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  void validateAndSubmit() {
    if (validateAndSave()) {
      setState(() {
        address = addressController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0C9869),
          title: Text("Thanh Toán",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

        ),
        body: Consumer<Cart>(
            builder: (context, cart,child) {

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                        child:
                        Text('Chọn phương thức thanh toán',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

                    ),
                    Column(
                      children: <Widget>[
                        RadioListTile(
                          title: Text('Thanh toán bằng tiền mặt'),
                          value: 1,
                          groupValue: _pay,
                          onChanged: (value){setState(() {
                            _pay =  value;
                          });},
                        ),
                        RadioListTile(
                          title: Text('Thanh toán online'),
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
                        Text('Chọn thời gian giao hàng',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

                    ),
                    Column(
                      children: <Widget>[
                        RadioListTile(
                          title: Text('Nhanh(<=1h)'),
                          value: 1,
                          groupValue: _time,
                          onChanged: (value){setState(() {
                            _time =  value;
                          });},
                        ),
                        RadioListTile(
                          title: Text('Chậm(<=2h)'),
                          value: 0,
                          groupValue: _time,
                          onChanged: (value){setState(() {
                            _time =  value;
                          });},
                        )
                      ],
                    ),
                    Container(
                        padding:EdgeInsets.only(top: 10,bottom: 10),
                        child:
                        Text('Địa chỉ của bạn',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))

                    ),
                    Container(
                      padding:EdgeInsets.only(left: 20,right: 20),
                      child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                                labelText: 'Số nhà, Tên đường ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            validator: (value) => value.isEmpty ? 'Address can\'t be empty' : null,
                            onSaved: (value) => address = value.trim(),
                          )
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.only(left: 20,right: 50),
                          child: Text('Phường',textAlign: TextAlign.left,style: TextStyle(fontSize: 16),),
                        ),
                        DropdownButton(
                            value: _quan,
                            items: [
                              DropdownMenuItem(
                                child: Text("Mai Động"),
                                value: "Mai Động",
                              ),
                              DropdownMenuItem(
                                child: Text("Giáp Bát"),
                                value: "Giáp Bát",
                              ),
                              DropdownMenuItem(
                                  child: Text("Linh Đàm"),
                                  value: "Linh Đàm"
                              ),
                              DropdownMenuItem(
                                  child: Text("Phùng Khoan"),
                                  value: "Phùng Khoan"
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _quan = value;
                              });
                            }),

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.only(left: 20,right: 50,top: 10),
                          child: Text('Quận',textAlign: TextAlign.left,style: TextStyle(fontSize: 16),),
                        ),
                        DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("Hoàng Mai"),
                                value: "Hoàng Mai",
                              ),
                              DropdownMenuItem(
                                child: Text("Hai Bà Trưng"),
                                value: "Hai Bà Trưng",
                              ),
                              DropdownMenuItem(
                                  child: Text("Hoài Kiếm"),
                                  value: "Hoài Kiếm"
                              ),
                              DropdownMenuItem(
                                  child: Text("Ba Đình"),
                                  value: "Ba Đình"
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),


                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top:5,left: 20,right: 30),
                          child:  RaisedButton(
                            onPressed:() {},
                            child: Text("Chọn trên bản đồ"),),
                        ),
                        Container(
                          padding: EdgeInsets.only(top:5,left: 20),
                          child:  RaisedButton(
                            onPressed: () {
                              validateAndSubmit();
                              String userAddress = address+_quan+_value;
                              cart.createCart(cart.ListItem, cart.uid,userAddress,cart.totalPrice(cart.ListItem),widget.ramdomNumber,_time);
                              cart.addListCart(widget.ramdomNumber, cart.uid,cart.totalPrice(cart.ListItem) , cart.ListItem[0].imgPath);
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderSuccess(id: widget.ramdomNumber,)));
                             // showDialog();
                            },
                            child: Text("Thanh toán"),),
                        )
                      ],
                    )



                  ],
                ),
              );
                }
    ));
  }
  Widget showDialog(){
    return successDialog(
      context,
      "Đặt hàng thành công",

      positiveText: "Theo dõi",
      positiveAction: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>TabBarCart()));
      },
    );
        }


}
