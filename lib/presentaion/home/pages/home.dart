import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/home/widgets/categories.dart';
import 'package:ecommerce/presentaion/home/widgets/header.dart';
import 'package:ecommerce/presentaion/home/widgets/new_in.dart';
import 'package:ecommerce/presentaion/home/widgets/search_field.dart';
import 'package:ecommerce/presentaion/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              SearchFieldHome(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              const Categories(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              const TopSelling(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              const NewIn(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              // _allProducts(),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              // _products(context)
            ],
          ),
        ),
        // bottomNavigationBar: ,
      ),
    );
  }

  // ignore: unused_element
  Widget _allProducts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'All Products',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _products(context) {
    return SizedBox(
      height: Const.mediaQueryHeight(context) / 1.5,
      child: GridView.builder(
        // scrollDirection: ,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.dg,
          mainAxisSpacing: 10.dg,
          childAspectRatio: 0.6.sign,
          mainAxisExtent: 220.dg,
        ),
        itemCount: hoodiesImages.length - 3,
        itemBuilder: (context, index) {
          return ProductCard(
            title: hoodiesTitles[index],
            price: hoodiesPrices[index],
            discountedPrice: hoodiesDiscountedPrices[index],
            image: hoodiesImages[index],
          );
        },
      ),
    );
  }
}
