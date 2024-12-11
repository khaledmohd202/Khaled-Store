import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';
import 'package:ecommerce/core/constants/const.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/add_to_bag.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/favorite_button.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/product_images.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/product_price.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/product_quantity.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/product_title.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/selected_color.dart';
import 'package:ecommerce/presentaion/product_detail/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var product = dummyProducts;
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
        action: const FavoriteButton(),
        height: 50.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImages(images: product[0].images),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.02),
            ProductTitle(title: product[0].title),
            ProductPrice(
                title:
                    "\$${product[0].discountedPrice != 0 ? product[0].discountedPrice.toString() : product[0].price.toString()}"),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.01),
            SelectedSize(sizes: product[0].sizes),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.015),
            SelectedColor(colors: colorsDummy),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.015),
            const ProductQuantity(),
            SizedBox(height: Const.mediaQueryHeight(context) * 0.015),
          ],
        ),
      ),
      bottomNavigationBar: const AddToBag(),
    );
  }
}
