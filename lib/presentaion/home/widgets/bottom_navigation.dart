import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pagesBottomNavigation[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              iconsBottomNavigation[0],
              color: index == 0 ? AppColors.primary : Colors.grey,
              width: 25.w,
              height: 25.h,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              iconsBottomNavigation[1],
              color: index == 1 ? AppColors.primary : Colors.grey,
              width: 25.w,
              height: 25.h,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              iconsBottomNavigation[2],
              color: index == 2 ? AppColors.primary : Colors.grey,
              width: 25.w,
              height: 25.h,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              iconsBottomNavigation[3],
              color: index == 3 ? AppColors.primary : Colors.grey,
              width: 25.w,
              height: 25.h,
            ),
            label: '',
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        backgroundColor: AppColors.background,
      ),
    );
  }
}
