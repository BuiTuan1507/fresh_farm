import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/Message.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class AdminHelp extends StatefulWidget {
  String uid;
  String name;
  AdminHelp({Key key, this.uid, this.name})
      : super(key: key);
  @override
  _AdminHelpState createState() => _AdminHelpState();
}

class _AdminHelpState extends State<AdminHelp> {
    String text= "";
    var timeNow = DateTime.now();

    _buildMessage(Message me) {
      final Container msg = Container(
        margin: me.isAdmin
            ? EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 80.0,
        )
            : EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,

        ),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: me.isAdmin ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: me.isAdmin
              ? BorderRadius.circular(15.0
          )
              : BorderRadius.circular(15.0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(bottom: 5,right: 10),
                  child: Text(me.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),),
                ),
                Container(
                  child:  Text(

                    '${DateFormat('H:m  dd-MM-yyyy').format(me.time.toDate())}',
                    style: TextStyle(
                      color: (me.isAdmin == true) ? Colors.white: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.0,),


            Text(
              me.text,
              style: TextStyle(
                color: (me.isAdmin == true) ? Colors.white: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
      if (me.isAdmin) {
        return msg;
      }
      return Row(
        children: <Widget>[
          msg,

        ],
      );
    }

    _buildMessageComposer(Cart cart) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        height: 70.0,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  text = value;
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message...',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Message m = new Message(widget.uid, true, Timestamp.fromDate(timeNow), text, false, false, widget.name);
                cart.createChatUser(m);
              },
            ),
          ],
        ),
      );
    }


    Widget build(BuildContext context) {
      List<Message> userChat = Provider.of<List<Message>>(context);
      Size size = MediaQuery.of(context).size;
      List<Message> u = [];

      return (userChat != null) ? Consumer<Cart>(
          builder: (context, cart,child) {
            for(int i = 0; i < userChat.length; i++){
                if (userChat[i].uid == widget.uid){



                  String uid = userChat[i].uid;
                  bool isAdmin = userChat[i].isAdmin;
                  Timestamp time = userChat[i].time;
                  String text = userChat[i].text;
                  bool isLike = userChat[i].isLike;
                  bool unread = userChat[i].unread;
                  String name = userChat[i].name;
                  Message m = new Message(uid, isAdmin, time, text, isLike, unread, name);
                    u.add(m);


                }
            }
            if(u!= null){
              for (int i =0; i< u.length; i++){
                for(int j = 0; j< u.length; j++){
                  if(u[j].time.millisecondsSinceEpoch <  u[i].time.millisecondsSinceEpoch){
                    Message m = u[j];
                    u[j] = u[i];
                    u[i] = m;
                  }
                }
              }
            }
            return  Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                centerTitle: true,
                backgroundColor: Color(0xFF0C9869),
                title: Text(
                  "Help",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  children: <Widget>[
                    (u != null) ? Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          child: ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.only(top: 15.0),
                            itemCount: u.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Message message = u[index];

                              return _buildMessage(message);
                            },
                          ),
                        ),
                      ),
                    ) : Container(
                      child: Center(
                        child: Text("Bạn chưa có tin nhắn nào", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),),
                      ),
                    ),
                    _buildMessageComposer(cart),
                  ],
                ),
              ),
            ) ;
          }
      ) : Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: CircularProgressIndicator(),
      );
    }

}
