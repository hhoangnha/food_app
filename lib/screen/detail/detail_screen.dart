import 'package:flutter/material.dart';
import 'package:food_app/screen/cart/controller/cart_controller.dart';
import 'package:food_app/screen/home/model/product.dart';
import 'package:get/get.dart';


class DetailScreen extends StatelessWidget {
  final Product product;
  
  const DetailScreen({ Key key, this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Get.toNamed('/cart');
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.shopping_bag, color:Colors.grey),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  <Widget>[
            Stack(
                children: <Widget>[
                  Container(
                    width: size.width,
                    child: Expanded(
                      child: Image.network('${product.imageLink}',
                        fit: BoxFit.cover
                      )

                    ),
                  ),
                  
                ],
              ),

            TextButton(onPressed: null, child: 
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: GestureDetector( 
                    onTap: (){cartController.addToCart(product);},
                    child: Text('Add to cart', style: TextStyle(color: Colors.white),)
                  ),
                ),
            ),
            

          ],
        ),
      ),
    );
  }
}