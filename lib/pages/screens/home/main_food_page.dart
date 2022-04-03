import 'package:ecommerce/pages/screens/home/food_page_body.dart';
import 'package:ecommerce/pages/widgets/big_text.dart';
import 'package:ecommerce/pages/widgets/small_text.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height40, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      BigText(
                        text: 'Türkiye',
                        color: AppColors.mainColor,
                        size: Dimensions.height25,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Şehir',
                            size: Dimensions.height13,
                            color: Colors.black54,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_drop_down_rounded,
                              size: Dimensions.width15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height50,
                      height: Dimensions.height50,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: Dimensions.height25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
