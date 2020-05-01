import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mecommerce/app/config/StringsSet.dart';
import 'package:mecommerce/app/products/model/DataModel.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';

class ProductBloc {
  final _productController = StreamController<List<DataModel>>();

  Stream<List<DataModel>> get productStream => _productController.stream;

  void getData(String productType) async {
    String jsonFile = '';
    if (productType == StringsSet.fashionDress) {
      jsonFile = 'assets/json/fashionProducts.json';
    }else if(productType == StringsSet.newDress){
      jsonFile = 'assets/json/newProducts.json';
    }

    List<DataModel> data = await loadFashionData(jsonFile).catchError((err) {
      print(err);
    });
    _productController.sink.add(data);
  }

  Future<List<DataModel>> loadFashionData(String jsonFile) async {
    String jsonString = await CommonMethods.loadAJsonAsset(jsonFile);

    final parsed =
        json.decode(jsonString.toString()).cast<Map<String, dynamic>>();

    return parsed
        .map<DataModel>((json) => new DataModel.fromJson(json))
        .toList();
  }

  void dispose() {
    _productController.close();
  }
}
