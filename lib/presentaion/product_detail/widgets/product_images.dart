import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyProduct = getDummyProducts();
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200.w,
            // decoration: BoxDecoration(
            //   image: DecorationImage(fit: BoxFit.fill, image: dummyProduct[index])
            // ),
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(width: Const.mediaQueryWidth(context) * 0.01),
        itemCount: dummyProduct.length,
      ),
    );
  }
}
