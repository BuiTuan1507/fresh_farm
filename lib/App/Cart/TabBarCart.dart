import 'package:flutter/material.dart';
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
      length: 4,

      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            title: Text('Giỏ Hàng',style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
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
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Tất cả"),
                    ),
                  ),
                ]
            ),
          ),
          body: TabBarView(
            children: [
              Checkout(),
             ShipCart(),
              Center(
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 40),
                  )),
              Center(
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 40),
                  )),

            ],
          ),
        ),
      ),
    );;
  }
}
