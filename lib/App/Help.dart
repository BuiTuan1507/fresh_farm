import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Model/Message.dart';
import 'package:fresh_farm/App/Model/cart_item_bloc.dart';
import 'package:provider/provider.dart';
class AdminHelp extends StatefulWidget {
  @override
  _AdminHelpState createState() => _AdminHelpState();
}

class _AdminHelpState extends State<AdminHelp> {
    String text= "";

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
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
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
                  child: Text(me.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.black),),
                ),
                Container(
                  child:  Text(
                    me.time,
                    style: TextStyle(
                      color: (me.isAdmin == true) ? Colors.white: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.0,),
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
                Message m = new Message("a", false, "11", text, false, false, "tuan");
                cart.createChatUser(m);
              },
            ),
          ],
        ),
      );
    }


    Widget build(BuildContext context) {
      return Consumer<Cart>(
          builder: (context, cart,child) {
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
                    Expanded(
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
                            itemCount: chats.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Message message = chats[index];

                              return _buildMessage(message);
                            },
                          ),
                        ),
                      ),
                    ),
                    _buildMessageComposer(cart),
                  ],
                ),
              ),
            );
          }
      );
    }

}
