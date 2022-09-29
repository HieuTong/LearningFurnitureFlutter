import 'package:flutter/material.dart';
import 'package:furniture_app_flutter/constants.dart';
import 'package:furniture_app_flutter/models/Products.dart';
import 'package:furniture_app_flutter/screens/details/components/product_description.dart';
import 'package:furniture_app_flutter/screens/details/components/product_info.dart';
import 'package:furniture_app_flutter/size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(product: product, press: () {}),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 2,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: defaultSize * 32,
                  width: defaultSize * 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
