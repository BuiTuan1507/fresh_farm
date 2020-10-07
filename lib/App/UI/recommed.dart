import 'package:flutter/material.dart';
//import 'package:plant_app/screens/details/details_screen.dart';

import 'constants.dart';
import 'package:fresh_farm/App/Products/Detail.dart';
class Recomends extends StatelessWidget {
  const Recomends({
    Key key, this.image, this.title, this.price,
  }) : super(key: key);
  final image, price, title;



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _buildCard(context,"Xoài",'440',"assets/Fruits/xoai.jpg",),


          _buildCard(context, "Thịt lợn", '440',"assets/meatAndEgg/pork.jpg",),
         _buildCard(context, 'Hoa Tulip', '150', 'assets/flower/tulip.jpg')
        ],
      ),
    );
  }
}


  Widget _buildCard(BuildContext context, String title, String price, String image) {
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
           // onTap: (){
           //   Navigator.of(context).push(

             //     MaterialPageRoute(builder: (context) => Detail(
               //       assetPath: image,
                 //     cookieprice:price,
                  //    cookiename: title
               //   )));
           // },
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
                         //text: "$country".toUpperCase(),
                         //style: TextStyle(
                          // color: kPrimaryColor.withOpacity(0.5),
                          //),
                         //),
                      ],
                    ),
                  ),
                  Spacer(),
                   Text(
                    '\$$price',
                    style: Theme.of(context)
                       .textTheme
                      .button
                      .copyWith(color: kPrimaryColor),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

