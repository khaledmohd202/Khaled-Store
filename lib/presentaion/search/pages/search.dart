import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/presentaion/search/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        height: 70.h,
        title: SearchField(),
        // backgroundColor: Colors.white,
      ),
      // body: _notFound(),
    );
  }

  Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.notFound),
        Padding(
          padding: EdgeInsets.all(16.dg),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  // Widget _products() {
  //   return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //     crossAxisCount: 2,
  //     crossAxisSpacing: 10.dg,
  //     mainAxisExtent: 10.dg,
  //     childAspectRatio: 0.6.sign,
  //   ), itemBuilder: (context, index) {
  //     return ProductCard(title: title, price: price, discountedPrice: discountedPrice, image: image);
  //   },)
  // }
}
