import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recomended_product_controller.dart';
import 'package:ecommerce/models/product_model.dart';

import 'package:ecommerce/pages/widgets/big_text.dart';
import 'package:ecommerce/pages/widgets/icon_and_text_widget.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/app_constants.dart';

import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.width.toString());
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoadeg
              ? SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProduct.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(
                          position, popularProducts.popularProduct[position]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProduct.isEmpty
                ? 1
                : popularProducts.popularProduct.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(Dimensions.height7),
              activeSize: Size(Dimensions.height16, Dimensions.height10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.width5),
              ),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Tavsiye edilen',
                size: Dimensions.height22,
              ),
              SizedBox(
                width: Dimensions.width7,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: Text(
                  '.',
                  style: TextStyle(
                      fontSize: Dimensions.height20, color: Colors.grey),
                ),
              ),
              SizedBox(
                width: Dimensions.width7,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'Yemek listesi',
                  style: TextStyle(
                      fontSize: Dimensions.height15, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        GetBuilder<RecomendedProductController>(builder: (recomendedProducts) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recomendedProducts.recomendedProductList.length,
            itemBuilder: (context, index) {
              ProductModel recomendedPro =
                  recomendedProducts.recomendedProductList[index];
              return recomendedProducts.isLoaded
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.getRecomendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.height25,
                          right: Dimensions.height25,
                          bottom: Dimensions.height10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.listViewImgSize,
                              width: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height20),
                                image: DecorationImage(
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      "/uploads/" +
                                      recomendedPro.img!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width7,
                                    top: Dimensions.height10,
                                    right: Dimensions.height5),
                                height: Dimensions.listViewTextConSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.height25),
                                    bottomRight:
                                        Radius.circular(Dimensions.height25),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      recomendedPro.name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Dimensions.height15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height7,
                                    ),
                                    Text(
                                      recomendedPro.location!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimensions.height12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle,
                                          size: Dimensions.height13,
                                          iconColor: AppColors.iconColor1,
                                          text: 'Normal',
                                          fontSize: Dimensions.height12,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.location_on,
                                          size: Dimensions.height13,
                                          iconColor: AppColors.mainColor,
                                          text: '1.7km',
                                          fontSize: Dimensions.height12,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: Dimensions.width5,
                                          ),
                                          child: IconAndTextWidget(
                                            icon: Icons.schedule,
                                            size: Dimensions.height13,
                                            iconColor: AppColors.iconColor2,
                                            text: '32 min',
                                            fontSize: Dimensions.height12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : CircularProgressIndicator(
                      color: AppColors.mainColor,
                    );
            },
          );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel product) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimensions.height5,
                right: Dimensions.height5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height35),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(
                        0xFF9294cc,
                      ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConstants.BASE_URL + "/uploads/" + product.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height25,
                  right: Dimensions.height25,
                  bottom: Dimensions.height10),
              height: Dimensions.pageViewTextContainer,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.height20,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0XFFe8e8e8),
                    blurRadius: 4.0,
                    offset: Offset(0, 5),
                  )
                ],
                border: Border.all(
                  width: 0.2,
                  color: Colors.black45,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height10,
                    top: Dimensions.height20,
                    bottom: Dimensions.height10),
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
                            product.stars!,
                            (index) => Icon(Icons.star,
                                color: AppColors.mainColor,
                                size: Dimensions.height16),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(fontSize: Dimensions.height13),
                        ),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          '1287 comments',
                          style: TextStyle(fontSize: Dimensions.height13),
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
                          fontSize: Dimensions.height13,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          size: Dimensions.height25,
                          iconColor: AppColors.mainColor,
                          text: '1.7km',
                          fontSize: Dimensions.height13,
                        ),
                        IconAndTextWidget(
                          icon: Icons.schedule,
                          size: Dimensions.height25,
                          iconColor: AppColors.iconColor2,
                          text: '32 min',
                          fontSize: Dimensions.height13,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
