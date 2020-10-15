import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
import 'Rating1.dart';
class RatingAndReview extends StatefulWidget {
  @override
  _RatingAndReviewState createState() => _RatingAndReviewState();


}

class _RatingAndReviewState extends State<RatingAndReview> {
  int id;
  String uid;
  @override
  Widget build(BuildContext context) {
    List userList = Provider.of<List<Rating>>(context);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Rating and Review',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),

        ),

        body: Consumer<Cart>(
          builder: (context,cart,child){
            print(cart.idRating);
            print(uid);

            uid = cart.uid;// uid
            int count = 0;// dem so binh luan cua user ve san pham
            List<Rating> now = [];// chua cac binh luan cua san pham id nay
            for (int i =0 ;i < userList.length;i++){// tinh count va add cac binh luan vao 1 list
              if(cart.idRating == userList[i].id){
                count = count + 1;
                now.add(userList[i]);
              }
            }


            return count > 0
                ? Column(
              children: <Widget>[

                Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: count,
                      itemBuilder: (BuildContext context, i) {
                        final cartList = now;


                        return new Container(
                          height: 100,

                          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 20),

                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                      padding:EdgeInsets.only(left: 10,right: 0, top:4, bottom: 4),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context).push(

                                          //   MaterialPageRoute(builder: (context) => Detail(
                                          //     itemProduct: cartList[i],
                                          //)));
                                        },
                                        child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage('assets/1.jpg'),
                                                    fit: BoxFit.fill))
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(left: 0, right: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                    child: Text('Tuan', textAlign: TextAlign.left,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                                    )
                                                )
                                              ],
                                            ),


                                            Column(
                                              children: <Widget>[
                                                Center(
                                                    child: Text('${cartList[i].rating}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                                    )
                                                  //${cartList[i].rating}
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(

                                          children: <Widget>[
                                           // buildText(cartList[i]),
                                            SizedBox(width: queryData.size.width*0.5, child: buildText(cartList[i])),
                                          ],
                                        )






                                      ],
                                    ),
                                  ),



                                ],
                              ),

                            );






                      },
                    )
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Rating1()));
                    },
                    child: Text('Danh gia san pham', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                )





              ],
            )
                : Center(child: Text("San pham chua co danh gia nao"));
          },

        ));}


}
Widget buildText(Rating rating){
  return Container(
    child: Container(
      color: Colors.white54,
      child: Text(
        rating.text,
          overflow: TextOverflow.fade, style: TextStyle(fontSize: 17,)
      ),
    ),
  );
}