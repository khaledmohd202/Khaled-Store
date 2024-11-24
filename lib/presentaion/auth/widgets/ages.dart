import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/presentaion/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce/presentaion/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce/presentaion/auth/bloc/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is AgesLoaded) {
            return _ages(state.ages);
          }

          if (state is AgesLoadFailure) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context.read<AgeSelectionCubit>().selectAge(
                  ages[index].data()['value'],
                );
          },
          child: Text(
            ages[index].data()['value'],
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      itemCount: ages.length,
    );
  }
}
