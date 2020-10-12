

import 'package:flutter/material.dart';
import 'package:fresh_farm/App/Cart/cart_item_bloc.dart';
import 'package:fresh_farm/App/Cart/shopping_cart.dart';
import 'package:fresh_farm/App/Service/home.dart';
import 'package:fresh_farm/App/Service/signup.dart';
import 'package:fresh_farm/Login/signIn.dart';
import 'package:fresh_farm/test.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Model/authentication.dart';
import 'Model/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Model/service.dart';
void main() {
  runApp(
      MyApp(

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseService firebaseServices = FirebaseService();
    return MultiProvider(
      providers: [
        StreamProvider<List<Item>>.value(value: firebaseServices.getItemList),
        ChangeNotifierProvider(create: (context) => Cart()),

      ],
      child: MaterialApp(
        title: 'Fresh Farm',
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => new SignupPage(),
          '/checkout':(BuildContext context)=> new Checkout()
        },

        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new RootPage(auth: new Auth(),)
         //create: (BuildContext context) =>firebaseServices.getItemList(),
          //child:  new RootPage(
            //  auth: new Auth()),

        ));

    //IntroScreen()
    //);
    //MyHomePage(),

  }
}
