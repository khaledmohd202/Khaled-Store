import 'package:ecommerce/presentaion/home/widgets/categories.dart';
import 'package:ecommerce/presentaion/home/widgets/header.dart';
import 'package:ecommerce/presentaion/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.024),
            SearchField(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.024),
            const Categories(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.024),
            // TopSelling(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.024),
            // NewIn(),
          ],
        ),
      ),
    );
  }
}
