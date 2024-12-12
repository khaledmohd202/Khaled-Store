import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/configs/assets/app_images.dart';
import 'package:ecommerce/domain/product/entities/color.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:ecommerce/presentaion/home/pages/home.dart';
import 'package:ecommerce/presentaion/home/pages/notification.dart';
import 'package:ecommerce/presentaion/home/pages/orders.dart';
import 'package:ecommerce/presentaion/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

//=========> Categories List View "images & Titles"
List<String> categoriesImage = [
  AppImages.hoodiesCategory,
  AppImages.shortsCategory,
  AppImages.shoesCategory,
  AppImages.bagsCategory,
  AppImages.accessoriesCategory,
];
List<String> categoriesTitle = [
  'Hoodies',
  'Shorts',
  'Shoes',
  'Bags',
  'Accessories',
];

//=========> TopSelling List View "images & Titles"
List<String> topSellingImages = [
  AppImages.topSelling1,
  AppImages.topSelling2,
  AppImages.topSelling3,
];
List<String> topSellingTitles = [
  'Men\'s Harrington Jacket',
  'Max Cipro Men\'s Slides',
  'Men\'s Coaches Jacket'
];
List<String> topSellingPrices = [
  '\$148.00',
  '\$55.00',
  '\$24.55',
];
List<String> topSellingDiscountedPrices = [
  '',
  '\$100.97',
  '',
];

//=========> New In List View "images & Titles"
List<String> newInImages = [
  AppImages.newIn1,
  AppImages.topSelling3,
  AppImages.newIn3,
];
List<String> newInTitles = [
  'Nike Unscripted',
  'Nike SB',
  'Nike Windrunner',
];
List<String> newInPrices = [
  '\$120.00',
  '\$100.00',
  '\$52.97',
];
List<String> newInDiscountedPrices = [
  '',
  '',
  '',
];

//=========> BottomNavigationBar
List pagesBottomNavigation = [
  const Home(),
  const NotificationPage(),
  const Orders(),
  const SettingsPage(),
];
List<String> iconsBottomNavigation = [
  AppImages.homeBottomNavigation,
  AppImages.notificationBottomNavigation,
  AppImages.orderBottomNavigation,
  AppImages.profileBottomNavigation,
];

//=========> HoodiesSection
List<String> hoodiesImages = [
  AppImages.hoodiesSec1,
  AppImages.hoodiesSec2,
  AppImages.hoodiesSec3,
  AppImages.hoodiesSec4,
  // add another
  AppImages.topSelling1,
  AppImages.topSelling2,
  AppImages.topSelling3,
];
List<String> hoodiesTitles = [
  'Men\'s Fleece Pullover Hoodie',
  'Men\'s Ice-Dye Pullover Hoodie',
  'Men\'s Monogram Hoodie',
  'Men\'s Pullover Basketball Hoodie',
  //
  'Men\'s Harrington Jacket',
  'Max Cipro Men\'s Slides',
  'Men\'s Coaches Jacket'
];
List<String> hoodiesPrices = [
  '\$100.00',
  '\$128.97',
  '\$52.99',
  '\$105.00',
  //
  '\$148.00',
  '\$55.00',
  '\$24.55',
];
List<String> hoodiesDiscountedPrices = [
  '',
  '',
  '',
  '',
  //
  '',
  '',
  '',
];

// Combine Hoodies and New In Sections into a Single Dummy Products List
List<Map<String, String>> getDummyProducts() {
  final List<Map<String, String>> products = [];

  for (int i = 0; i < hoodiesImages.length; i++) {
    products.add({
      'image': hoodiesImages[i],
      'title': hoodiesTitles[i],
      'price': hoodiesPrices[i],
      'discountedPrice': hoodiesDiscountedPrices[i],
    });
  }

  for (int i = 0; i < newInImages.length; i++) {
    products.add({
      'image': newInImages[i],
      'title': newInTitles[i],
      'price': newInPrices[i],
      'discountedPrice': newInDiscountedPrices[i],
    });
  }

  return products;
}

//=========> Product Detail
List<ProductEntity> dummyProducts = [
  ProductEntity(
    categoryId: 'cat1',
    colors: [
      ProductColorEntity(title: 'Red', color: Colors.red),
      ProductColorEntity(title: 'Green', color: Colors.green),
      ProductColorEntity(title: 'Blue', color: Colors.blue),
    ],
    createdDate: Timestamp.now(),
    discountedPrice: 148.00,
    gender: 0,
    images: [
      AppImages.topSelling1,
      AppImages.productDetail1,
      AppImages.productDetail2
    ],
    price: 150.00,
    sizes: ['S', 'M', 'L', 'XL', '2XL', '3XL', '4XL', '5XL'],
    productId: 'prod1',
    salesNumber: 50,
    title: 'Men\'s Harrington Jacket',
  ),
  ProductEntity(
    categoryId: 'cat2',
    colors: [
      ProductColorEntity(title: 'Green', color: Colors.green),
    ],
    createdDate: Timestamp.now(),
    discountedPrice: 200.00,
    gender: 1,
    images: [AppImages.topSelling2],
    price: 250.00,
    sizes: ['M', 'L', 'XL'],
    productId: 'prod2',
    salesNumber: 30,
    title: 'Green Dress',
  ),
];
List<Color> colorsDummy = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.black,
];
List<String> titlesDummy = [
  'Red',
  'Green',
  'Blue',
  'Black',
];
