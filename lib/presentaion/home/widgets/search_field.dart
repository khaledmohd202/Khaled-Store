// import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/presentaion/search/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFieldHome extends StatelessWidget {
  SearchFieldHome({
    super.key,
  });
  final InputBorder? border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.r),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        // When this is set to true, the text cannot be modified by any shortcut or keyboard operation.
        readOnly: true,
        onTap: () {
          AppNavigator.push(context, const Search());
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.dg),
          focusedBorder: border,
          enabledBorder: border,
          prefixIcon: SvgPicture.asset(
            AppVectors.search,
            fit: BoxFit.none,
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}
