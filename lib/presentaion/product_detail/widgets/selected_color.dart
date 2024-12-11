// import 'package:ecommerce/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedColor extends StatefulWidget {
  const SelectedColor({super.key, required this.colors});
  final List<Color> colors;

  @override
  State<SelectedColor> createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedColor> {
  Color selectedColor = Colors.greenAccent;
  void selectColor() {
    AppBottomSheet.display(
      context,
      ProductColors(
        onColorSelected: (color) {
          setState(() {
            selectedColor = color;
          });
        },
        colors: widget.colors,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectColor,
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
          children: [
            Text(
              'Color',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            Row(
              children: [
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: Const.mediaQueryWidth(context) * 0.015),
                Transform.translate(
                  offset: const Offset(5, -5),
                  child: Icon(Icons.keyboard_arrow_down, size: 30.dg),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
