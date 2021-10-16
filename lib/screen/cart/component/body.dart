import 'package:flutter/material.dart';
import 'package:food_app/screen/cart/controller/cart_controller.dart';
import 'package:food_app/screen/home/model/product.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CartController cartController = Get.find();
    Size size = MediaQuery.of(context).size;
    
    return Obx((){
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: cartController.products.length,
              itemBuilder: (BuildContext context, int index){
                return CartItem(
                  cartController: cartController,
                  product: cartController.products.keys.toList()[index],
                  quantity: cartController.products.values.toList()[index],
                  index: index,
                );
              },
            ),
          ),
          cartController.products.length > 0 ? Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text('${cartController.total}', style: TextStyle(color: Colors.white, fontSize: 18),),
              ],
            ),
          ) : Text(''),
        ],
      );
    });
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
    this.cartController, 
    this.quantity, 
    this.index, 
    this.product,
  }) : super(key: key);

  final CartController cartController;
  final int quantity, index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width/4,
          child: Image.network('${product.imageLink}'),
        ),
        Expanded(child: 
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID: ${product.id}'),
                    Text('${product.price}', style: TextStyle(color: Colors.red),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          cartController.removeQuantity(product);
                        }, icon: Icon(Icons.remove_circle)),
                        Text("${quantity}"),
                        IconButton(onPressed: (){
                          cartController.addQuantity(product);
                        }, icon: Icon(Icons.add_circle)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            

          )
        )

      ],
    );
  }
}