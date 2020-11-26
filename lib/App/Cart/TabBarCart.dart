import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/AllCart.dart';
import 'package:fresh_farm/App/Cart/ListShipCart.dart';
import 'package:fresh_farm/App/Cart/ShipCart.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';
import 'package:fresh_farm/App/Products/productRecommed.dart';
class TabBarCart extends StatefulWidget {
  @override
  _TabBarCartState createState() => _TabBarCartState();
}

class _TabBarCartState extends State<TabBarCart> {
  @override
  Widget build(BuildContext context) {
    bool hasBeenPress = false;
    return DefaultTabController(
      length: 3,

      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0C9869),
            elevation: 0, // ? la gi day

            title: Text('Giỏ Hàng',style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: ()
                  {
                   Navigator.pop(context);
                  }
              ),
            bottom: TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Đơn hàng"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Đang giao"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Đã giao"),
                    ),
                  ),

                ]
            ),
          ),
          body: TabBarView(
            children: [
              Checkout(),

              ListShipCart(),
              AllCart()
            ],
          ),
        ),
      ),
    );;
  }
}
