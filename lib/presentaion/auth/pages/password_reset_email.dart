import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/presentaion/auth/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmail extends StatelessWidget {
  const PasswordResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          _sentEmail(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          _returnToLoginButton(context),
        ],
      ),
    );
  }

  Widget _emailSending() {
    return Center(
      child: SvgPicture.asset(AppVectors.emailSending),
    );
  }

  Widget _sentEmail() {
    return const Center(
      child: Text('We sent a code for you, to reset your password'),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, SignIn());
      },
      width: MediaQuery.of(context).size.width*0.2,
      title: 'Return to Login',
    );
  }
}
