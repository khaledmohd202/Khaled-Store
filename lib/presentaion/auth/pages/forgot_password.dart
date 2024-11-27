// import 'package:ecommerce/main.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/domain/auth/use_cases/send_password_reset_email.dart';
import 'package:ecommerce/presentaion/auth/pages/password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: '',
        height: 30.h,
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.push(context, const PasswordResetEmail());
            }
          },
          child: Padding(
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
                _continueButton(),
                SizedBox(height: 15.h),
              ],
            ),
          ),
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
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _continueButton() {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          // AppNavigator.push(context,  EnterPassword());
          context.read<ButtonStateCubit>().execute(
                useCase: SendPasswordResetEmailUseCase(),
                params: _emailController.text,
              );
        },
        title: 'Continue',
      );
    });
  }
}
