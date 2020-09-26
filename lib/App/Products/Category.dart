import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCategoryPage extends StatefulWidget{
  _MyCategoryPageState createState() => new _MyCategoryPageState(); // ghi de 1 doi tuong trang thai private
}
class _MyCategoryPageState extends State<MyCategoryPage>{
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Danh muc",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
    ),
    body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 1,

                children: <Widget>[
                  _buildCard('Hoa quả',  'assets/1.jpg', context),
                  _buildCard('Rau củ', 'assets/2.jpg', context),
                  _buildCard('Hạt',
                      'assets/3.jpg',  context),
                  _buildCard('Thịt',  'assets/4.jpg', context),
                  _buildCard('Dầu ăn',  'assets/farm.jpg', context),

                  _buildCard('Sản phẩm chế biến',  'assets/food.jpg', context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name,  String imgPath, context) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10.0, right: 5.0),
        child: InkWell(
            onTap: () {
              //truyen tham so
            },
            child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),

                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.withOpacity(0.2),

                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Color(0xFFEFDB)),
                child: Column(children: [

                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(

                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 9.0),

                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      ),)

                ]))));
  }
}

