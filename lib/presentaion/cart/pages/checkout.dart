import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/cart/pages/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'CheckOut',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        height: 40.h,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.dg),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _addressField(
              context,
              'Shipping Address',
              _addressController,
            ),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.01),
            _addressField(
              context,
              'Payment Address',
              _paymentController,
            ),
            const Spacer(),
            calculateReceipt(
                'Subtotal', '\$${dummyProducts[0].discountedPrice * 2}'),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
            calculateReceipt('Shipping Cost', '\$8.00'),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
            calculateReceipt('Tax', '\$0.0'),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
            calculateReceipt(
                'Total', '\$${(dummyProducts[0].discountedPrice * 2) + 8}'),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
            _placeOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _placeOrderButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ElevatedButton(
        onPressed: () {
          AppNavigator.push(context, const OrderPlaced());
        },
        child: SizedBox(
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${(dummyProducts[0].discountedPrice * 2) + 8}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                'Place Order',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addressField(
      BuildContext context, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      minLines: 2,
      maxLines: 4,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  Widget calculateReceipt(String priceTitle, String price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: .10.h),
      child: Row(
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
      ),
    );
  }
}
