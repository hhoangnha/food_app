import 'package:flutter/material.dart';
import 'package:food_app/screen/cart/cart_screen.dart';
import 'package:food_app/screen/detail/detail_screen.dart';
import 'package:food_app/screen/home/home_screen.dart';
import 'package:food_app/screen/login/login_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: [
        GetPage(name: '/login', page: ()=>LoginScreen()),
        GetPage(name: '/home', page: ()=>HomeScreen()),
        GetPage(name: '/detail', page: ()=>DetailScreen()),
        GetPage(name: '/cart', page: ()=>CartScreen()),
      ],
      initialRoute: '/login',
    );
  }
}
