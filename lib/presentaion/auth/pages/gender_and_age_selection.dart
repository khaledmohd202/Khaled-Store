import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/domain/auth/use_cases/sign_up.dart';
import 'package:ecommerce/presentaion/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce/presentaion/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce/presentaion/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce/presentaion/auth/widgets/ages.dart';
import 'package:ecommerce/presentaion/home/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderAndAgeSelection extends StatelessWidget {
  const GenderAndAgeSelection({
    super.key,
    required this.userCreationReq,
  });
  final UserCreationReq userCreationReq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(height: 60.h),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          // There is an error the value of it not appear yet (Because BlocListener"<ButtonStateCubit, ButtonState>")
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
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
              AppNavigator.pushAndRemove(context, const BottomNavigation());
            }
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  children: [
                    _tellUs(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    _genders(context),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    _howOld(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    _age(),
                  ],
                ),
              ),
              const Spacer(),
              Builder(
                builder: (context) => _finishButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Text(
      'Tell us about yourself',
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          genderTile(context, 1, 'Men'),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          genderTile(context, 2, 'women'),
        ],
      );
    });
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().selectedIndex ==
                    genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _howOld() {
    return Text(
      'How old are you',
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomSheet.display(
            context,
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges()),
              ],
              child: const Ages(),
            ),
          );
        },
        child: Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(state),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      );
    });
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 70.h,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: BasicReactiveButton(
          onPressed: () {
            userCreationReq.gender =
                context.read<GenderSelectionCubit>().selectedIndex;
            userCreationReq.age = context.read<AgeSelectionCubit>().selectedAge;
            context.read<ButtonStateCubit>().execute(
                  useCase: SignUpUseCase(),
                  params: userCreationReq,
                );
          },
          title: 'Finish',
        ),
      ),
    );
  }
}
