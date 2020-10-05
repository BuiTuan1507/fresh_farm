import 'dart:async';

class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      {'name': 'Hoa qua', 'price': 20, 'id': 1,'imgPath':'assets/1.jpg'},
      {'name': 'Thit heo', 'price': 100, 'id': 2,'imgPath':'assets/4.jpg'},
      {'name': 'Rau cu', 'price': 10, 'id': 3,'imgPath':'assets/2.jpg'},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg'},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg'},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg'},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg'},
      {'name': 'Bot', 'price': 90, 'id': 4,'imgPath':'assets/3.jpg'},
    ],
    'cart items': []
  };

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();