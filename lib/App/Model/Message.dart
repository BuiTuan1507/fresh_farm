import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Message{
  String uid;
  bool isAdmin;
  Timestamp time;
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
