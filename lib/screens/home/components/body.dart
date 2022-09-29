import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/constants.dart';
import 'package:furniture_app_flutter/screens/home/components/product_cart.dart';
import 'package:furniture_app_flutter/screens/home/components/recommend_products.dart';
import 'package:furniture_app_flutter/screens/home/components/title_text.dart';
import 'package:furniture_app_flutter/services/fetchCategories.dart';
import 'package:furniture_app_flutter/services/fetchProducts.dart';
import 'package:furniture_app_flutter/size_config.dart';
import '../../../models/Categories.dart';
import '../../../models/Products.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: 'Browse by Categories',
              ),
            ),
            FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data!)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: 'Recommends For You',
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommendProducts(products: snapshot.data!)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
          ],
        ),
      ),
    );
  }
}
