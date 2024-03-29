import 'package:flutter/material.dart';

import 'package:fresh_farm/App/ListProduct/hoaqua.dart';
import 'package:fresh_farm/App/ListProduct/ngucoc.dart';
import 'package:fresh_farm/App/ListProduct/thit.dart';
import 'package:fresh_farm/App/Products/FastFood.dart';
import 'constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/nhan/hoaqua.jpg",
            title: "Hoa quả",
            //country: "Russia",
           // price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Hoaqua(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/thit.jpg",
            title: "Sản phẩm thịt",
           // country: "Russia",
          //  price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                 builder: (context) => Thit(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/ngucoc.jpg",
            title: "Ngũ cốc",
          //  country: "Russia",
           // price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>Ngucoc(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        //TextSpan(
                         // text: "$country".toUpperCase(),
                         // style: TextStyle(
                         //   color: kPrimaryColor.withOpacity(0.5),
                        //  ),
                       // ),
                      ],
                    ),
                  ),
                  Spacer(),
                 // Text(
                  //  '\$$price',
                  //  style: Theme.of(context)
                   //     .textTheme
                    //    .button
                    //    .copyWith(color: kPrimaryColor),
                //  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
