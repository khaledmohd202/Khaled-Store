import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/settings/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('Order Items'),
        height: 45.h,
      ),
      body: _products(),
    );
  }

  Widget _products() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: const ProductOrderedCardSettings(),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: Const.mediaQueryHeight(context) * 0.01),
      itemCount: 2,
    );
  }
}
