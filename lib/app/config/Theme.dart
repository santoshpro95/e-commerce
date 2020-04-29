import 'package:flutter/material.dart';

import 'ColorsSet.dart';

class OpenFlutterEcommerceTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      accentColor: AppColors.red,
      bottomAppBarColor: AppColors.lightGray,
      backgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          textTheme: theme.textTheme.copyWith(
              caption: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400))),
      textTheme: theme.textTheme
          .copyWith(
        //over image white text
        headline: theme.textTheme.headline.copyWith(
            fontSize: 48,
            color: AppColors.white,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w900),
        title: theme.textTheme.title.copyWith(
            fontSize: 24,
            color: AppColors.black,
            fontWeight: FontWeight.w900,
            fontFamily: 'Metropolis'), //

        //product title
        display1: theme.textTheme.display1.copyWith(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Metropolis'),

        display2: theme.textTheme.display2.copyWith(
            fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
        //product price
        display3: theme.textTheme.display3.copyWith(
            color: AppColors.lightGray,
            fontSize: 14,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
        display4: theme.textTheme.display4.copyWith(
            fontFamily: 'Metropolis', fontWeight: FontWeight.w500),

        subtitle: theme.textTheme.headline.copyWith(
            fontSize: 18,
            color: AppColors.black,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
        subhead: theme.textTheme.headline.copyWith(
            fontSize: 24,
            color: AppColors.darkGray,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500),
        //red button with white text
        button: theme.textTheme.button.copyWith(
            fontSize: 14,
            color: AppColors.white,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500),
        //black caption title
        caption: theme.textTheme.caption.copyWith(
            fontSize: 34,
            color: AppColors.black,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w700),
        //light gray small text
        body1: theme.textTheme.body1.copyWith(
            color: AppColors.lightGray,
            fontSize: 11,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
        //view all link
        body2: theme.textTheme.body2.copyWith(
            color: AppColors.black,
            fontSize: 11,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
      )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }
}