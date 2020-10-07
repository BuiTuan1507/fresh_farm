import 'dart:async';
class Item{
  int id;
  String name;
  String imgPath;
  int price;
  String info;
  int count;
  bool isLike;

  Item(this.id, this.name, this.imgPath, this.price, this.info, this.count,
      this.isLike);
}
class Cart{
  int id;
  List <Item> ListItem;
  int total;
  int delivery;
  int subTotal;

  Cart(this.id, this.ListItem, this.total, this.delivery, this.subTotal);
}


class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;


  final Map allItems = {
    'shop items': [
      {'name': 'Hoa qua', 'price': 20, 'id': 1,'imgPath':'assets/1.jpg','count':1,'isLike':false},
      {'name': 'Thit heo', 'price': 100, 'id': 2,'imgPath':'assets/4.jpg','count':1,'isLike':false},
      {'name': 'Rau cu', 'price': 10, 'id': 3,'imgPath':'assets/2.jpg','count':1,'isLike':false,},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 5,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 6,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 7,'imgPath':'assets/3.jpg','count':1,'isLike':false},
      {'name': 'Bot', 'price': 90, 'id': 8,'imgPath':'assets/3.jpg','count':1,'isLike':false},
    ],
    'cart items': [],
    'favorite items':[],
    'info item': [],
    'total':0,
    'delivery':0,
    'subTotal': 0
  };

  void addToInfo(item) {
    allItems['info item'].add(item);
  }
  void removeToInfo(item){
    allItems['info item'].remove(item);
  }

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    allItems['total'] = allItems['total']+item['count']*item['price'];
    allItems['delivery'] = allItems['total']* 0.05;
    allItems['subTotal'] = allItems['total'] + allItems['delivery'];
    cartStreamController.sink.add(allItems);

  }
  


  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    allItems['total'] = allItems['total']-item['count']*item['price'];
    allItems['delivery'] = allItems['total']* 0.05;
    allItems['subTotal'] = allItems['total'] + allItems['delivery'];
    cartStreamController.sink.add(allItems);
  }
  void addToFavorite(item) {
    allItems['favorite items'].add(item);
    item['isLike']= true;
    cartStreamController.sink.add(allItems);

  }



  void removeFromFavorite(item) {
    allItems['favorite items'].remove(item);
    item['isLike'] = false;
    cartStreamController.sink.add(allItems);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();