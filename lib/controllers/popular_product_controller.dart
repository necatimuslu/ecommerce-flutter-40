import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/data/repository/popular_product_repo.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProduct = [];
  List<ProductModel> get popularProduct => _popularProduct;

  bool _isLoaded = false;
  bool get isLoadeg => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  late CartController _cart;

  Future<void> getPopularProductList() async {
    try {
      Response response = await popularProductRepo.getPopularProductList();

      if (response.statusCode == 200) {
        _popularProduct = [];

        _popularProduct.addAll(Product.fromJson(response.body).products);
        _isLoaded = true;
        update();
      } else {}
    } catch (e) {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = chechkQuantity(_quantity += 1);
    } else {
      _quantity = chechkQuantity(_quantity -= 1);
    }
    update();
  }

  int chechkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        'Ürün miktar',
        'Daha fazla azaltamazsın',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
  }
}
