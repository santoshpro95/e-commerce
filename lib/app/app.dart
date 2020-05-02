import 'package:flutter/material.dart';
import 'package:mecommerce/app/config/Theme.dart';
import 'package:mecommerce/app/details/DetailsScreen.dart';
import 'package:mecommerce/app/home/ui/HomeScreen.dart';
import 'package:mecommerce/app/login/LoginScreen.dart';
import 'package:mecommerce/app/splash/SplashScreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: OpenFlutterEcommerceTheme.of(context),
      routes: {
        SplashScreen.tag: (context) => SplashScreen(),
        LoginScreen.tag: (context) => LoginScreen(),
        HomeScreen.tag: (context) => HomeScreen(),
        DetailsScreen.tag: (context) => DetailsScreen()
      },
      initialRoute: SplashScreen.tag,
    );
  }
}
