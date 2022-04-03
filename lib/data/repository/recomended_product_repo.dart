import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecomendedProductRepo({required this.apiClient});

  Future<Response> getRecomendedProduct() async {
    return await apiClient.getData(AppConstants.RECOMENDED_PRODUCT_URL);
  }
}
