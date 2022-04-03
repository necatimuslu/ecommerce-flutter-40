import 'package:ecommerce/data/repository/recomended_product_repo.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:get/get.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;

  RecomendedProductController({required this.recomendedProductRepo});

  List<ProductModel> _recomendedProductList = [];
  List<ProductModel> get recomendedProductList => _recomendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecomendedProductList() async {
    try {
      Response response = await recomendedProductRepo.getRecomendedProduct();

      if (response.statusCode == 200) {
        _recomendedProductList = [];
        _recomendedProductList.addAll(Product.fromJson(response.body).products);
        _isLoaded = true;
        update();
      }
    } catch (e) {}
  }
}
