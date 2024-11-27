import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    super.key,
    this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.content,
  });
  final void Function()? onPressed;
  final String title;
  final double? height;
  final double? width;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize:
            Size(width ?? MediaQuery.of(context).size.width, height ?? 40.h),
      ),
      child: content ??
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
