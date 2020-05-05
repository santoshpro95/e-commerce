import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonMethods{


  static closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }


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



  /// used for login and signUp

  Future<List<String>> getListLocalStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future setListLocalStorage(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }


}