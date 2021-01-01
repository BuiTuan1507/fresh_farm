import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/Shipping.dart';
class OrderSuccess extends StatefulWidget {
  int id;
  OrderSuccess({Key key, this.id}) : super(key: key);
  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Stack(
          children: <Widget>[
            Positioned(
              top: size.height*0.2,
              left: size.width*0.22,
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/shoppingcart.png",fit: BoxFit.fill,),
              ),
            ), 
            Positioned(
              top: size.height*0.55,
              left: size.width*0.2,
              child: Container(
                child: Text("Đặt hàng thành công !", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
              ),

            ),
            Positioned(
              top: size.height*0.8,
              left: size.width*0.25,
              child: Container(
                height: 45,
                width: size.width*0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF0C9869)
                ),
                child: InkWell(


                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Shipping(id: widget.id,)));
                  },
                  child: Center(
                    child: Text("Theo dõi đơn hàng", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white),),
                  ),
                ),
              ),
            )
          ],
      ),
    );
  }
}
