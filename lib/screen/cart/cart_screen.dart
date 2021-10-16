import 'package:flutter/material.dart';
import 'package:food_app/screen/cart/component/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text("Product Cart"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}