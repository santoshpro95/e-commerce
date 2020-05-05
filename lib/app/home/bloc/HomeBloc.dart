import 'dart:async';
import 'dart:convert';

import 'package:mecommerce/app/products/model/DataModel.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';

class HomeBloc{

  final _bottomBarController = StreamController<int>();

  Stream<int> get bottomBarStream => _bottomBarController.stream;




  void onChangeBottomBar(int position){
    _bottomBarController.sink.add(position);
  }



  void dispose(){

    _bottomBarController.close();
  }



}