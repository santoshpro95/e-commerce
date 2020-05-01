import 'package:flutter/services.dart';

class CommonMethods{

  static valueOrDefault(var data) {
    if (data != null) {
      return data;
    } else {
      if (data.runtimeType == bool) {
        return false;
      } else if (data.runtimeType == int) {
        return 0;
      } else if (data.runtimeType == String) {
        return "";
      }
      return "";
    }
  }


  static Future<String> loadAJsonAsset(String jsonFile) async {
    return await rootBundle.loadString(jsonFile);
  }


}