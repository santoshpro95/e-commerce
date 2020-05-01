import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/products/ProductsScreen.dart';

class HomeFragmentBloc {

  void openProduct(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          productType: type,
        ),
      ),
    );
  }
}
