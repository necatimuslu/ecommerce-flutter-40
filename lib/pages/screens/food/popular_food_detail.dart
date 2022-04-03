import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';

import 'package:ecommerce/pages/widgets/extendable_text_widget.dart';
import 'package:ecommerce/pages/widgets/icon_and_text_widget.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProduct[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.foodDetailImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        AppConstants.BASE_URL + "/uploads/" + product.img!),
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimensions.height40,
              left: Dimensions.height20,
              child: InkWell(
                onTap: () => Get.toNamed(Routes.mainFoodScreen),
                child: Container(
                  height: Dimensions.width25,
                  width: Dimensions.width25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.height20,
                    ),
                    color: const Color(
                      0xFFfcf4e4,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.height10,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: Dimensions.height20,
                      color: const Color(0xFF756d54),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimensions.height40,
              right: Dimensions.height20,
              child: Container(
                height: Dimensions.width25,
                width: Dimensions.width25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.height20,
                  ),
                  color: const Color(
                    0xFFfcf4e4,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: Dimensions.height20,
                  color: const Color(0xFF756d54),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.foodDetailImgSize - Dimensions.height45,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.width20,
                    ),
                    topRight: Radius.circular(
                      Dimensions.width20,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: TextStyle(
                        fontSize: Dimensions.height20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                color: AppColors.mainColor,
                                size: Dimensions.height18),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          product.stars.toString(),
                          style: TextStyle(fontSize: Dimensions.height14),
                        ),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          '1287 comments',
                          style: TextStyle(fontSize: Dimensions.height14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle,
                          size: Dimensions.height25,
                          iconColor: AppColors.iconColor1,
                          text: 'Normal',
                          fontSize: Dimensions.height16,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          size: Dimensions.height25,
                          iconColor: AppColors.mainColor,
                          text: '1.7km',
                          fontSize: Dimensions.height16,
                        ),
                        IconAndTextWidget(
                          icon: Icons.schedule,
                          size: Dimensions.height25,
                          iconColor: AppColors.iconColor2,
                          text: '32 min',
                          fontSize: Dimensions.height16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height22,
                    ),
                    Text(
                      'Yemek içeriği',
                      style: TextStyle(
                        fontSize: Dimensions.height22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height22,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExtandableTextWidget(text: product.description!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProController) {
            return Container(
              height: Dimensions.bottomNavigationContainerSize,
              padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width15,
                right: Dimensions.width15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimensions.height40,
                  ),
                  topRight: Radius.circular(
                    Dimensions.height40,
                  ),
                ),
                color: AppColors.buttonBckground,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height25,
                      bottom: Dimensions.height25,
                      left: Dimensions.width7,
                      right: Dimensions.width7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimensions.height25,
                      ),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProController.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                            size: Dimensions.height20,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width7,
                        ),
                        Text(
                          popularProController.quantity.toString(),
                          style: TextStyle(
                              fontSize: Dimensions.height22,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: Dimensions.width7,
                        ),
                        InkWell(
                          onTap: () {
                            popularProController.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                            size: Dimensions.height20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height25,
                      bottom: Dimensions.height25,
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.height25,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        popularProController.addItem(product);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${product.price.toString()}TL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.height15,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.height5,
                          ),
                          Text(
                            'Sepete Ekle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.height15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
