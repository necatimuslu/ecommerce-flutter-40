import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recomended_product_controller.dart';
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/data/repository/cart_repo.dart';
import 'package:ecommerce/data/repository/popular_product_repo.dart';
import 'package:ecommerce/data/repository/recomended_product_repo.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecomendedProductController(recomendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
