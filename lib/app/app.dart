import 'package:flutter/material.dart';
import 'package:mecommerce/app/config/Theme.dart';
import 'package:mecommerce/app/home/ui/HomeScreen.dart';
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
        HomeScreen.tag: (context) => HomeScreen()
      },
      initialRoute: SplashScreen.tag,
    );
  }
}
