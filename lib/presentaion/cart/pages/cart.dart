import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/cart/widgets/checkout_widget.dart';
import 'package:ecommerce/presentaion/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  final int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        height: 40.h,
      ),
      body: index == 1
          ? Stack(
              children: [
                _products(),
                const Align(
                    alignment: Alignment.bottomCenter, child: CheckoutWidget()),
              ],
            )
          : _cartIsEmpty(),
    );
  }

  Widget _products() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
      itemBuilder: (context, index) {
        return const ProductOrderedCard();
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: Const.mediaQueryHeight(context) * 0.01),
      itemCount: 2,
    );
  }

  Widget _cartIsEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.cartBag),
          SizedBox(height: 20.h),
          Text(
            "Cart is empty",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
