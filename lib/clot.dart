import 'package:ecommerce/core/configs/theme/app_theme.dart';
import 'package:ecommerce/presentaion/splash/bloc/splash_cubit.dart';
import 'package:ecommerce/presentaion/splash/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Clot extends StatelessWidget {
  const Clot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: BlocProvider(
        create: (context) => SplashCubit()..appStarted(),
        child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
