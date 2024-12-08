import 'package:ecommerce/presentaion/home/widgets/categories.dart';
import 'package:ecommerce/presentaion/home/widgets/header.dart';
import 'package:ecommerce/presentaion/home/widgets/new_in.dart';
import 'package:ecommerce/presentaion/home/widgets/search_field.dart';
import 'package:ecommerce/presentaion/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              SearchFieldHome(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              const Categories(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              const TopSelling(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              const NewIn(),
            ],
          ),
        ),
        // bottomNavigationBar: ,
      ),
    );
  }
}
