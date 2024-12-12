import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/auth/pages/sign_in.dart';
import 'package:ecommerce/presentaion/settings/widgets/my_favorites_tile.dart';
import 'package:ecommerce/presentaion/settings/widgets/my_orders_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text('Settings'),
        hideBack: true,
        height: 45.h,
      ),
      body: Padding(
        // padding: EdgeInsets.all(16.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),

        child: Column(
          children: [
            const MyFavoritesTile(),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.015),
            const MyOrdersTile(),
            // Spacer(),
            TextButton(
                onPressed: () =>
                    AppNavigator.pushReplacement(context, SignIn()),
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                )),
            // BasicAppButton(
            //   title: 'LogOut',
            //   onPressed: () => Navigator.pop(context),
            // )
          ],
        ),
      ),
    );
  }
}
