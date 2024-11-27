import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/presentaion/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce/presentaion/auth/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: '',
        height: 30.h,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signText(context),
              SizedBox(height: 40.h),
              _firstNameField(context),
              SizedBox(height: 20.h),
              _lastNameField(context),
              SizedBox(height: 20.h),
              _emailField(context),
              SizedBox(height: 20.h),
              _passwordField(context),
              SizedBox(height: 60.h),
              _continueButton(context),
              SizedBox(height: 10.h),
              _haveAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signText(BuildContext context) {
    return Text(
      'Create Account',
      style: TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextField(
      controller: _firstNameController,
      decoration: const InputDecoration(
        hintText: 'First Name',
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      controller: _lastNameController,
      decoration: const InputDecoration(
        hintText: 'Last Name',
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: !_isPasswordVisible,
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Email Address',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelection(
            userCreationReq: UserCreationReq(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            ),
          ),
        );
      },
      title: 'Continue',
    );
  }

  Widget _haveAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 13.sp,
        ),
        children: [
          const TextSpan(text: 'Have an Account? '),
          TextSpan(
            text: ' Sign In',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SignIn());
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
