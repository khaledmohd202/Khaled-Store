// import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/core/constants/const.dart';
// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              width: 180.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  // image: AssetImage(product[index].images[index])
                  image: AssetImage(images[index]),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(width: Const.mediaQueryWidth(context) * 0.01),
        itemCount: images.length,
      ),
      // child: FanCarouselImageSlider.sliderType1(
      //   sliderHeight: 380.h,
      //   imagesLink: images,
      //   autoPlay: false,
      //   isAssets: true,
      //   // showIndicator: false,
      //   // showArrowNav: true,
      //   // sidesOpacity: 0.5,
      //   sliderDuration: const Duration(milliseconds: 100),
      //   slideViewportFraction: 0.8,
      // ),
    );
  }
}
