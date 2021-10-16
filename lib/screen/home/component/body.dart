import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/screen/cart/controller/cart_controller.dart';
import 'package:food_app/screen/detail/detail_screen.dart';
import 'package:food_app/screen/home/controller/product_controller.dart';
import 'package:get/get.dart';


class Body extends StatelessWidget {
  const Body({ Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productController = Get.put(ProductController());


    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: 
        Obx((){
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: productController.productList.value.length,
            
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade400,
                          )
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(product: productController.productList[index])),
                            );
                          },
                          child: Hero(
                            tag: "123",
                            child: Image.network(
                              '${productController.productList[index].imageLink}',
                              loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null ? 
                                          loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                            )
                          ),
                        ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10 / 4),
                    child: Text(
                      '${productController.productList[index].id}',
                    ),
                  ),
                ],
              );
            }
            
          );
        }),

      

    );
  }
}