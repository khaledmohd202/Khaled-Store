import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavorites extends StatelessWidget {
  const MyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('My Favorites'),
        // hideBack: true,
        height: 45.h,
      ),
      body: _products(),
    );
  }

  Widget _products() {
    return Expanded(
      child: GridView.builder(
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.dg,
          mainAxisSpacing: 10.dg,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            title: hoodiesTitles[index],
            image: hoodiesImages[index],
            price: hoodiesPrices[index],
            discountedPrice: hoodiesDiscountedPrices[index],
          );
        },
      ),
    );
  }
}
