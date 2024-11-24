// import 'package:ecommerce/main.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentaion/auth/pages/enter_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: '',
        height: 30.h,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signText(context),
            SizedBox(height: 15.h),
            _emailField(context),
            SizedBox(height: 15.h),
            _continueButton(context),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _signText(BuildContext context) {
    return Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }



  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }



  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPassword());
      },
      title: 'Continue',
    );
  }
}
