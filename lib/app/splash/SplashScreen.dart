import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mecommerce/app/config/ColorsSet.dart';
import 'package:mecommerce/app/config/ImagesSet.dart';
import 'package:mecommerce/app/config/Routes.dart';
import 'package:mecommerce/app/splash/SplashBloc.dart';

class SplashScreen extends StatefulWidget {
  static const tag = Routes.splashScreen;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashBloc = SplashBloc();

  @override
  void initState() {
    _splashBloc.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child:  Image.asset(
            ImagesSet.logo,
          ),
        ),
      ),
    );
  }
}
