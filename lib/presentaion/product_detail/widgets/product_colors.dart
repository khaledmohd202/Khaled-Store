import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColors extends StatefulWidget {
  const ProductColors(
      {super.key, required this.onColorSelected, required this.colors});
  final Function(Color) onColorSelected;
  final List<Color> colors;

  @override
  State<ProductColors> createState() => _ProductColorsState();
}

class _ProductColorsState extends State<ProductColors> {
  int? selectedIndex;

  void selectColor(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onColorSelected(widget.colors[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(16.dg),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Color',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => selectColor(index),
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColors.primary
                          : AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          titlesDummy[index],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: widget.colors[index],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            selectedIndex == index
                                ? Icon(
                                    Icons.check,
                                    size: 30.dg,
                                  )
                                : Container(
                                    width: 30.w,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: Const.mediaQueryHeight(context) * 0.02,
              ),
              itemCount: colorsDummy.length,
            ),
          ),
          
        ],
      ),
    );
  }
}
