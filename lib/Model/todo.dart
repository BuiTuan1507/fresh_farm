
import 'package:firebase_database/firebase_database.dart';

class Item {
  int id;
  String name;
  String imgPath;
  bool isLike;
  int price;
  int count;


  Item(this.id, this.name, this.imgPath, this.isLike, this.price, this.count);

  Item.fromSnapshot(DataSnapshot snapshot) :
        id = snapshot.value['id'],
        name = snapshot.value["name"],
        imgPath = snapshot.value["imgPath"],
        price = snapshot.value["price"],
      isLike = snapshot.value["isLike"],
      count = snapshot.value["count"];
  toJson() {
    return {
      "id": id,
      "name": name,
      "imgPath": imgPath,
      "price" : price,
      "count": count,
      "isLike":isLike
    };
  }
}