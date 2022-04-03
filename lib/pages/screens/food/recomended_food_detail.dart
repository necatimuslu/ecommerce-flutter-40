import 'package:ecommerce/controllers/recomended_product_controller.dart';
import 'package:ecommerce/pages/widgets/extendable_text_widget.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecomendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecomendedProductController>().recomendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height50 + Dimensions.height20,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Dimensions.width25,
                    height: Dimensions.height40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.height35,
                      ),
                      color: AppColors.buttonBckground.withOpacity(0.8),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Container(
                  width: Dimensions.width25,
                  height: Dimensions.height40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.height35,
                    ),
                    color: AppColors.buttonBckground.withOpacity(0.8),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: Text(
                    product.name!,
                    style: TextStyle(
                        fontSize: Dimensions.height22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.width15),
                    topRight: Radius.circular(Dimensions.width15),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + "/uploads/" + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            //  ,

            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.height5,
                      right: Dimensions.height5,
                    ),
                    child: ExtandableTextWidget(text: product.description!),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: Dimensions.height12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width25, right: Dimensions.width25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimensions.height40,
                    height: Dimensions.height40,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.width25,
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: Dimensions.height30,
                    ),
                  ),
                  Text(
                    '${product.price} TL X 0',
                    style: TextStyle(
                      fontSize: Dimensions.height25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: Dimensions.height40,
                    height: Dimensions.height40,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.width25,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: Dimensions.height30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height14,
            ),
            Container(
              height: Dimensions.width60,
              decoration: BoxDecoration(
                color: AppColors.buttonBckground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimensions.width30,
                  ),
                  topRight: Radius.circular(
                    Dimensions.width30,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Dimensions.width40,
                    width: Dimensions.width40,
                    margin: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.width20,
                      ),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: Dimensions.height25,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width5,
                    ),
                    padding: EdgeInsets.only(
                      top: Dimensions.height25,
                      bottom: Dimensions.height25,
                      left: Dimensions.width7,
                      right: Dimensions.width7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.width20,
                      ),
                      color: AppColors.mainColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${product.price} TL',
                          style: TextStyle(
                            fontSize: Dimensions.height20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.height10,
                        ),
                        Text(
                          '| Sepete Ekle',
                          style: TextStyle(
                            fontSize: Dimensions.height20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
