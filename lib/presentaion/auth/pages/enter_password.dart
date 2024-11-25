// import 'package:ecommerce/main.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/data/auth/models/user_sign_in_req.dart';
import 'package:ecommerce/presentaion/auth/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterPassword extends StatelessWidget {
  final UserSignInReq signInReq;
  EnterPassword({super.key, required this.signInReq});

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: 'Your Password',
        height: 30.h,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 15.h,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signText(context),
              SizedBox(height: 15.h),
              _passwordField(context),
              SizedBox(height: 15.h),
              _continueButton(),
              SizedBox(height: 15.h),
              _forgotPassword(context),
            ],
          ),
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

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  Widget _continueButton() {
    return BasicReactiveButton(
      onPressed: () {},
      title: 'Continue',
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 13.sp,
        ),
        children: [
          const TextSpan(text: 'Forgot Password? '),
          TextSpan(
            text: ' Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  const ForgotPassword(),
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
