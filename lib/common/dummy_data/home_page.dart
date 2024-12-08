import 'package:ecommerce/core/configs/assets/app_images.dart';
import 'package:ecommerce/presentaion/home/pages/home.dart';
import 'package:ecommerce/presentaion/home/pages/notification.dart';
import 'package:ecommerce/presentaion/home/pages/profile.dart';
import 'package:ecommerce/presentaion/home/pages/receipt.dart';

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
  const Notification(),
  const Receipt(),
  const Profile(),
];
List<String> iconsBottomNavigation = [
  AppImages.homeBottomNavigation,
  AppImages.notificationBottomNavigation,
  AppImages.receiptBottomNavigation,
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
