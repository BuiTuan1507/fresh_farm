

import 'package:flutter/material.dart';

import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,


            title: Text('Chi tiết sản phẩm',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                    color: Color(0xFF545D68))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Color(0xFF545D68)),
                onPressed: () {

                },
              ),
            ],
          ),

          body: Consumer<Cart>(
            builder: (context,cart,child){
              return InfoItemsListBuilder(context,cart);

            },

          ));
    }

  }



Widget InfoItemsListBuilder(context,cart){
  Size size = MediaQuery
      .of(context)
      .size;
  final infoItem = cart.infoItem;


  return SingleChildScrollView(
    child:Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
              'Rau cu',style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0C9869),
          )),
        ),
        SizedBox(height: 15,),
        Hero(
          tag: infoItem[0].imgPath,
          child: Image.asset(infoItem[0].imgPath,
            height: size.height * 0.3,
            width: double.infinity,
          fit: BoxFit.contain,),

        ),

        Center(
          child: Text('\$${infoItem[0].price}',style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C9869)   )),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(infoItem[0].name,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF0C9869)
                ),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      cart.add(infoItem[0]);
                      Navigator.of(context).push(

                          MaterialPageRoute(builder: (context) => Checkout()));
                    },
                      child: Text('Add to cart',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      )
                        )

                )
            )
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            cart.removeInfoItem(infoItem[0]);
          },
          child: Text("Xem them san pham"),
          color: Colors.green,
        ),
        SizedBox(height: 40)
      ],
    )



  );

}