import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Message{
  String uid;
  bool isAdmin;
  String time;
  String text;
  bool isLike;
  bool unread;
  String name;
  Message(this.uid, this.isAdmin, this.time, this.text, this.isLike, this.unread, this.name);
  Message.fromJson(Map<String,dynamic> data)
      :uid= data['uid'],
        isAdmin = data['isAdmin'],
        time = data['time'],
        text= data['text'],
          isLike = data['isLike'],

          unread = data['unread'],
        name = data['name'];
  Message.fromSnapshot(DocumentSnapshot snapshot) :
        uid = snapshot['uid'],
        isAdmin = snapshot["isAdmin"],
        time = snapshot["time"],
        isLike = snapshot['isLike'],
        unread = snapshot['unread'],

        text = snapshot["text"],
        name = snapshot['name'];

  toJson() {
    return {
      "uid": uid,

      "isAdmin": isAdmin,
        "unread": unread,
      "isLike":isLike,
      "time" : time,
      "text": text,
      "name":name,


    };
  }

}
List<Message> chats = [
  Message(
    "1qwqwa" ,false, '5:30 pm','Hey, how\'s it going? What did you do today?',false, true,"tuan"
  ),
  Message(
    "1qwqwa",true, '6:30 pm','aaaaaaaaaaaaaaaaaaaaaaaaaaaa',false, true,"admin"
  ),
  Message(
    "1qwqwa", false, '5:30 pm','Hey, how\'s it going? What did you do today?',false, true,"tuan"
  ),
  Message(
    "1qwqwa", true, '5:30 pm','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',false, true,"admin"
  ),

];