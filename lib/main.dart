import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recomended_product_controller.dart';
import 'package:ecommerce/helper/dependencies.dart' as dap;
import 'package:ecommerce/pages/screens/food/recomended_food_detail.dart';
import 'package:ecommerce/pages/screens/home/food_page_body.dart';
import 'package:ecommerce/pages/screens/home/main_food_page.dart';
import 'package:ecommerce/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dap.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
    return GetMaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
