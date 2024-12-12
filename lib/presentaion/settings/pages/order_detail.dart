import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/settings/pages/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('Order #362289'),
        height: 45.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _status(),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.05),
            _items(context),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.05),
            _shipping(context),
          ],
        ),
      ),
    );
  }

  Widget _status() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      // color: orderEntity.orderStatus[index].done
                      //     ? AppColors.primary
                      //     : Colors.white,
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    // child: orderEntity.orderStatus[index].done
                    //     ? const Icon(Icons.check)
                    //     : Container(),
                    child: Transform.scale(
                      scale: 1.2,
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: Const.mediaQueryWidth(context) * 0.015),
                  Text(
                    // hoodiesTitles[index],
                    'Men\'s Hoodies',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Text(
                'Created Date',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  // color: orderEntity.orderStatus[index].done
                  //     ? Colors.white
                  //     : Colors.grey,
                  color: Colors.white,
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: Const.mediaQueryHeight(context) * 0.05),
        reverse: true,
        itemCount: 2,
      ),
    );
  }

  Widget _items(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Items',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: Const.mediaQueryHeight(context) * 0.015),
          GestureDetector(
            onTap: () {
              AppNavigator.push(
                context,
                const OrderItems(),
              );
            },
            child: Container(
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.receipt_rounded),
                      SizedBox(width: Const.mediaQueryWidth(context) * 0.015),
                      Text(
                        '${hoodiesImages.length} Items',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      )
                    ],
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _shipping(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: Const.mediaQueryHeight(context) * 0.015),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.dg),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Text('orderEntity.shippingAddress'),
          ),
        ],
      ),
    );
  }
}
