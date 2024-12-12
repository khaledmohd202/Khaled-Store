import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/settings/pages/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('My Orders'),
        height: 45.h,
      ),
      body: _orders(),
    );
  }

  Widget _orders() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            AppNavigator.push(
                context,
                const OrderDetail(
                    // orderEntity: orders[index],
                    ));
          },
          child: Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.receipt_rounded),
                    SizedBox(width: 20.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #362289',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          '${hoodiesImages.length} item',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
      itemCount: hoodiesImages.length - 2,
    );
  }
}
