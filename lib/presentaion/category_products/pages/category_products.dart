import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          height: 40.h,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _categoryInfo(),
                SizedBox(height: Const.mediaQueryHeight(context) * 0.03),
                _products(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryInfo() {
    return Text(
      '${categoriesTitle[0]} ${hoodiesImages.length}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
    );
  }

  Widget _products(context) {
    return SizedBox(
      height: Const.mediaQueryHeight(context),
      child: GridView.builder(
        itemCount: hoodiesImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.dg,
          mainAxisSpacing: 20.dg,
          childAspectRatio: 0.6.sign,
          mainAxisExtent: 260,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            image: hoodiesImages[index],
            title: hoodiesTitles[index],
            discountedPrice: hoodiesDiscountedPrices[index],
            price: hoodiesPrices[index],
          );
        },
      ),
    );
  }
}
