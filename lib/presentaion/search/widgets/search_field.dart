import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.textEditingController, this.onChanged});
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.dg),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
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
