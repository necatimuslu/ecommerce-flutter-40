import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/pages/screens/food/popular_food_detail.dart';
import 'package:ecommerce/pages/screens/food/recomended_food_detail.dart';
import 'package:ecommerce/pages/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initial = '/';

  static List<GetPage> routes = [
    GetPage(
        name: Routes.mainFoodScreen,
        page: () {
          return MainFoodPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.popularFoodScreen,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.recomendedFoodScreen,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecomendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}

class Routes {
  static const mainFoodScreen = '/mainFoodScreen';
  static const popularFoodScreen = '/popularFoodScreen';
  static const recomendedFoodScreen = '/recomendedFoodScreen';

  static String getInitial() => "$mainFoodScreen";
  static String getPopularFood(int pageId) =>
      "$popularFoodScreen?pageId=$pageId";
  static String getRecomendedFood(int pageId) =>
      "$recomendedFoodScreen?pageId=$pageId";
}
