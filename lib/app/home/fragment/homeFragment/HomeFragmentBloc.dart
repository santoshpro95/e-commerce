import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/products/ProductsScreen.dart';
import 'package:mecommerce/app/products/model/DataModel.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';
import 'package:mecommerce/app/details/DetailsScreen.dart';

class HomeFragmentBloc {


  final _productController = StreamController<List<DataModel>>();

  Stream<List<DataModel>> get productStream => _productController.stream;




  void getData()async{

    List<DataModel> data = await loadFashionData('assets/json/newProducts.json').catchError((err) {
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


  void openDetails(DataModel dataModel, BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          dataModel: dataModel,
        ),
      ),
    );


  }

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


  void dispose(){
    _productController.close();
  }
}
