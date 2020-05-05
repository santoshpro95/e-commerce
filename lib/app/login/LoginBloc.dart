import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/home/ui/HomeScreen.dart';
import 'package:mecommerce/app/utils/CommonWidgets.dart';
import 'SignUpScreen.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';
import 'package:mecommerce/app/config/Config.dart';

class LoginBloc {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  CommonMethods commonMethods = new CommonMethods();

  List<String> name = new List();
  List<String> email = new List();
  List<String> password = new List();

  void login(BuildContext context) async {
    try {
      name = await commonMethods.getListLocalStorage(Config.nameListKey);
      email = await commonMethods.getListLocalStorage(Config.emailListKey);
      password =
          await commonMethods.getListLocalStorage(Config.passwordListKey);
    } catch (ex) {
      print(ex);
    }
    print(name);
    print(email);
    print(password);

    if (email.contains(emailText.text) &&
        password.contains(passwordText.text)) {


      for(int i =0; i< email.length; i++){

        if(email.contains(emailText.text) &&
            password.contains(passwordText.text)){
          Config.loggedInName = name[i];
          Config.loggedInEmail = email[i];
        }
      }

      Navigator.pushNamed(context, HomeScreen.tag);
    } else {
      CommonWidgets.showErrorMessage(
          scaffoldKey, "Email or Password is wrong, Please Try Again!");
    }
  }

  void signUp(BuildContext context) {
    Navigator.pushNamed(context, SignUpScreen.tag).then((val) {
      if (val != null) {
        if (val) {
          CommonWidgets.showSuccessMessage(
              scaffoldKey, "Successfully Registered");
        }
      }
    });
  }
}
