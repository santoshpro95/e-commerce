import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mecommerce/app/home/ui/HomeScreen.dart';
import 'package:mecommerce/app/login/LoginScreen.dart';

class SplashBloc{


  void init(BuildContext context){
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, LoginScreen.tag);
    });

  }


}