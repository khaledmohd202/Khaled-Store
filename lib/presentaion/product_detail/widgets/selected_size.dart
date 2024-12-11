import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/product_sizes.dart';

class SelectedSize extends StatefulWidget {
  const SelectedSize({super.key, required this.sizes});
  final List<String> sizes;

  @override
  State<SelectedSize> createState() => _SelectedSizeState();
}

class _SelectedSizeState extends State<SelectedSize> {
  String selectedSize = 'Select';

  void selectSize()  {
    AppBottomSheet.display(
      context,
      ProductSizes(
        sizes: widget.sizes,
        onSizeSelected: (size) {
          setState(() {
            selectedSize = size;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectSize,
      child: Container(
        height: 45.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        padding: EdgeInsets.all(12.dg),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
            ),
            Row(
              children: [
                Text(
                  selectedSize,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                SizedBox(width: Const.mediaQueryWidth(context) * 0.015),
                Transform.translate(
                  offset: const Offset(5, -5),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30.dg,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
