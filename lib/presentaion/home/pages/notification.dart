import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/assets/app_images.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/all_categories/pages/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('Notifications'),
        hideBack: true,
        height: 45.h,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
                scale: 1.3, child: Image.asset(AppImages.noNotificationYet)),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.08),
            Text(
              'No Notification Yet',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.01),
            Container(
              height: 50.h,
              width: 185.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: BasicAppButton(
                title: 'Explore Categories',
                onPressed: () {
                  AppNavigator.push(context, const AllCategories());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
