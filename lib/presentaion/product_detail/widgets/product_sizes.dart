import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizes extends StatefulWidget {
  const ProductSizes(
      {super.key, required this.sizes, required this.onSizeSelected});
  final List<String> sizes;
  final Function(String) onSizeSelected;

  @override
  State<ProductSizes> createState() => _ProductSizesState();
}

class _ProductSizesState extends State<ProductSizes> {
  int? selectedIndex;

  void selectSize(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onSizeSelected(widget.sizes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.mediaQueryHeight(context) / 2,
      padding: EdgeInsets.all(16.dg),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
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
                    'Size',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
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
                  onTap: () => selectSize(index),
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
                          widget.sizes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        selectedIndex == index
                            ? Icon(
                                Icons.check,
                                size: 30.dg,
                              )
                            : Container(width: 30.w),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: Const.mediaQueryHeight(context) * 0.02,
              ),
              itemCount: widget.sizes.length,
            ),
          ),
        ],
      ),
    );
  }
}
