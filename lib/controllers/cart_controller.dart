import 'package:ecommerce/data/repository/cart_repo.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  late Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(
      product.id!,
      () => CartModel(
        id: product.id,
        name: product.name,
        img: product.img,
        quantity: quantity,
        price: product.price,
        isExist: true,
        time: DateTime.now().toString(),
      ),
    );
  }
}
