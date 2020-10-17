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
   // return Consumer<Cart>(
       // builder: (context,cart,child){
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
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () {
                    //cart.addInfoItem(cart.detailItem);
                  },
                  child: Icon(
                    Icons.arrow_back,  // add custom icons also
                  ),
                ),

              ),


              body: Consumer<Cart>(
                builder: (context,cart,child){

                  int count = 0;
                  List<Rating> now = [];//
                  if (userList == null){
                    count = 0;
                    print(cart.idRating);
                  }else{
                    uid = cart.uid;// uid

                    print(cart.uid);
                    for (int i =0 ;i < userList.length;i++){// tinh count va add cac binh luan vao 1 list
                      if(cart.idRating == userList[i].id){
                        count = count + 1;
                        now.add(userList[i]);
                      }
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

                                padding: EdgeInsets.only(left: 0,top: 5,bottom: 5,right: 0),

                                    child: Row(

                                      children: <Widget>[
                                        Container(
                                            padding:EdgeInsets.only(left: 0,right: 0, top:4, bottom: 4),
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
                                                          image: AssetImage(cartList[i].photoURL),
                                                          fit: BoxFit.fill))
                                              ),
                                            )),
                                        Column(
                                          children: <Widget>[
                                             Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                        child: Text(cartList[i].name, textAlign: TextAlign.left,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                                        )
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                        padding: EdgeInsets.only(left: 40),
                                                        child: Text('${cartList[i].rating }', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green[800]),
                                                        )
                                                    ),]),
                                                Column(
                                                      children: <Widget>[
                                                        (cart.uid == cartList[i].uid) ? Container(
                                                          padding: EdgeInsets.only(left: 10),
                                                          child: IconButton(
                                                            onPressed: (){
                                                                cart.deleteReview(cartList[i].id);

                                                            },
                                                            icon: Icon(Icons.delete,size: 20,color: Colors.black45,),

                                                          ),
                                                        ) : Container(
                                                          height: 0,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                            Row(
                                              children:<Widget> [Container(
                                                color: Colors.white54,
                                                child: Text(
                                                    cartList[i].text,

                                                    overflow: TextOverflow.fade, style: TextStyle(fontSize: 17,)
                                                ),
                                              ),
                                            ])
                              ],

                                            ),

                                          ],

                                        ),
                              );},
                          )
                      ),
                      Center(
                        child:  RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Rating1()));
                          },
                          child: Text('Danh gia san pham', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),






                    ],
                  )
                      : Column(
                    children: <Widget>[
                      Center(
                        child: Text('San pham khong co danh gia nao', style: TextStyle(fontSize: 18),),
                      ),
                      Center(
                        child:  RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Rating1()));
                          },
                          child: Text('Danh gia san pham', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),

                    ],
                  );
                },

              ));
        //}


    //);
  }}
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

