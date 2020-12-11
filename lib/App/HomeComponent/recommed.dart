import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';


import 'constants.dart';
import 'package:fresh_farm/App/Products/Detail.dart';
class Recomend extends StatefulWidget {
  @override
  _RecomendState createState() => _RecomendState();
}

class _RecomendState extends State<Recomend> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      List<Item> userList1 = Provider.of<List<Item>>(context);
      return (userList1 != null) ?
      Consumer<Cart>(builder: (context, cart, child) {
        List<Item> userList = [];
        List<int> chiso = [9,17,25];
        for (int i = 0; i<userList1.length;i++){
          for(int j = 0;j<3;j++){
            if(userList1[i].id == chiso[j]){
              userList.add(userList1[i]);
              break;
            }
          }
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              _buildCard(
                  context, userList[0].name, userList[0].price.toString(),
                  userList[0].imgPath, userList[0], cart),
              _buildCard(
                  context, userList[1].name, userList[1].price.toString(),
                  userList[1].imgPath, userList[1], cart),
              _buildCard(
                  context, userList[2].name, userList[2].price.toString(),
                  userList[2].imgPath, userList[2], cart),


            ],
          ),
        );
      }) : Container(height: size.height,
          width: size.width,
          color: Colors.white,
          child: Text(
              "Loading",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)));
    }
  }





  Widget _buildCard(BuildContext context, String title, String price, String image,Item item,Cart cart) {
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
            onTap: (){
              cart.addInfoItem(item);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Detail()));
            },
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

