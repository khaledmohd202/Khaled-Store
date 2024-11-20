// import 'package:ecommerce/main.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentaion/auth/pages/enter_password.dart';
import 'package:ecommerce/presentaion/auth/pages/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: '',
        hideBack: true,
        height: 30.h,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 80.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signText(context),
            SizedBox(height: 20.h),
            _emailField(context),
            SizedBox(height: 15.h),
            _continueButton(context),
            SizedBox(height: 15.h),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signText(BuildContext context) {
    return Text(
      'Sign In',
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

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 13.sp,
        ),
        children: [
          const TextSpan(text: 'Do you have an account? '),
          TextSpan(
            text: ' Create One',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  const SignUp(),
                );
              },
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}