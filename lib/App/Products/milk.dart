import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Detail.dart';
class MyMilkPage extends StatefulWidget{
  _MyMilkPageState createState() => new _MyMilkPageState(); // ghi de 1 doi tuong trang thai private
}

class _MyMilkPageState extends State<MyMilkPage>{
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("FastFood",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),

        ),


        body: GridView.count(
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1.0,
            children: <Widget>[
              _buildCard('Gio lua', '\$3.99', 'assets/FastFood/giolua.jpg',
                  false, false, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg',
                  true, false, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg', false, true, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg',
                  false, false, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg',
                  false, false, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg',
                  false, false, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg',
                  false, false, context),
              _buildCard('Xuc xich', '\$3.99', 'assets/FastFood/xucxich.jpg',
                  false, false, context),
            ]

        ));}}

Widget _buildCard(String name, String price, String imgPath, bool added,
    bool isFavorite, context) {

  final size = MediaQuery.of(context).size;
  return Padding(

      padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 0, right: 0),
      child: InkWell(

          onTap: () {
            Navigator.of(context).push(

                MaterialPageRoute(builder: (context) => Detail(
                    assetPath: imgPath,
                    cookieprice:price,
                    cookiename: name
                )));
          },
          child: Container(
            //color: Color(0xFFEFDB),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Color(0xFFEFDB)

              ),
              child: Column(

                  children: [

                    Expanded(
                      //tag: imgPath,




                        child: Container(

                            height: size.height*0.3,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imgPath),
                                    fit: BoxFit.fill)))),
                    //SizedBox(height: 7.0),
                    Text(price,
                        style: TextStyle(
                            color: Color(0xFFCC8053),
                            fontFamily: 'Varela',
                            fontSize: 20.0)),
                    Text(name,
                        style: TextStyle(
                            color: Color(0xFF575E67),
                            fontFamily: 'Varela',
                            fontSize: 18.0)),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 20.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 16.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 16.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 16.0),
                            ],
                            Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      isFavorite
                                          ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                          : Icon(Icons.favorite_border,
                                          color: Color(0xFFEF7532))
                                    ])),
                          ]),
                    )
                  ]))));
}



