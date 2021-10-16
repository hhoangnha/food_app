import 'package:food_app/screen/home/model/product.dart';
import 'package:get/get.dart';

class CartController extends  GetxController{
  var products = {}.obs;

  void removeQuantity(Product product) {
    if(products.containsKey(product) && products[product] == 1){
      products.removeWhere((key, value) => key == product);
    }
    else{
      products[product] -=1;
    }
  }

  void addQuantity(Product product) {
    products[product] +=1;
  }

  void addToCart(Product product){
    if(products.containsKey(product)){
      products[product] +=1;
    }
    else{
      products[product] =1;
    }
    print(products.length);

    Get.snackbar(
      "Added to cart", "Product ${product.name}",
      snackPosition:SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  get subTotal => products.entries.map((product)=> product.key.price * product.value).toList();
  get total => products.entries.map((product)=> double.parse(product.key.price) * product.value).toList()
      .reduce((value, element) => value +element).toString();
}