import 'package:flutter/material.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';
import 'package:mecommerce/app/config/Config.dart';

class SignUpBloc{
  TextEditingController nameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  CommonMethods commonMethods = new CommonMethods();

  List<String> name = new List();
  List<String> email = new List();
  List<String> password = new List();


  void signUp(BuildContext context)async{
    /// clean list
    name.clear();
    email.clear();
    password.clear();


    /// add data in list
    name.add(nameText.text);
    email.add(emailText.text);
    password.add(passwordText.text);

    /// save list in local memory
try{
  await commonMethods.setListLocalStorage(Config.nameListKey, name);
  await commonMethods.setListLocalStorage(Config.emailListKey, email);
  await commonMethods.setListLocalStorage(Config.passwordListKey, password);
}catch(ex){
  print(ex);
}

    Navigator.pop(context, true);
  }


}