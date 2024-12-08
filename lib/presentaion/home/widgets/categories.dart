import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/presentaion/all_categories/pages/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _seeAll(context),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        _categories(context),
      ],
    );
  }

  Widget _seeAll(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, const AllCategories());
            },
            child: Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.115,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    categoriesImage[index],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                categoriesTitle[index],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        itemCount: categoriesImage.length,
      ),
    );
  }
}

/*
// class Categories extends StatelessWidget {
//   const Categories({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CategoriesDisplayCubit()..displayCategories(),
//       child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
//         builder: (context, state) {
//           if (state is CategoriesLoading) {
//             return const CircularProgressIndicator();
//           }
//           if (state is CategoriesLoaded) {
//             return Column(
//               children: [
//                 _seeAll(context),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                 _categories(state.categories, context),
//               ],
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }

//   Widget _categories(List<CategoryEntity> categories, BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.1,
//       child: ListView.separated(
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.06,
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: NetworkImage(
//                       ImageDisplayHelper.generateCategoryImageURL(
//                         categories[index].image,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               Text(
//                 categories[index].title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14.sp,
//                 ),
//               ),
//             ],
//           );
//         },
//         separatorBuilder: (context, index) =>
//             SizedBox(width: MediaQuery.of(context).size.width * 0.015),
//         itemCount: categories.length,
//       ),
//     );
//   }
// }
*/