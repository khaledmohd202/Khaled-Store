import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/presentaion/cart/pages/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.dg),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          calculateReceipt(
              'Subtotal', '\$${dummyProducts[0].discountedPrice * 2}'),
          calculateReceipt('Shipping Cost', '\$8.00'),
          calculateReceipt('Tax', '\$0.0'),
          calculateReceipt(
              'Total', '\$${(dummyProducts[0].discountedPrice * 2) + 8}'),
          BasicAppButton(
            title: 'CheckOut',
            onPressed: () => AppNavigator.push(context, Checkout()),
          ),
        ],
      ),
    );
  }

  Row calculateReceipt(String priceTitle, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          priceTitle,
          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
        ),
        Text(
          // '\$${CartHelper.calculateCartSubtotal(products).toString()}',
          price,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
      ],
    );
  }
}
