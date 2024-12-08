import 'package:ecommerce/common/dummy_data/home_page.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/presentaion/search/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce/common/widgets/app_bar/app_bar.dart';

import '../../../core/configs/assets/app_vectors.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  late List<Map<String, String>> filteredProducts;
  var dummyProducts = getDummyProducts();

  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = dummyProducts;
      } else {
        filteredProducts = dummyProducts.where((product) {
          final title = product['title']!.toLowerCase();
          return title.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(height: 50.h),
      body: Column(
        children: [
          SearchField(
            textEditingController: _searchController,
            onChanged: _filterProducts,
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? _notFound()
                : _products(filteredProducts),
          ),
        ],
      ),
    );
  }

  Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.notFound),
        Padding(
          padding: EdgeInsets.all(16.dg),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _products(List<Map<String, String>> products) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.dg,
        mainAxisSpacing: 10.dg,
        childAspectRatio: 0.6.sign,
        mainAxisExtent: 220.dg,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          title: product['title']!,
          price: product['price']!,
          discountedPrice: product['discountedPrice']!,
          image: product['image']!,
        );
      },
    );
  }
}
