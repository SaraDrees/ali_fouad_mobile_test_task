
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    highlightColor: Colors.transparent,
    // App bar theme
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.colorPrimary,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold, fontSize: 18.sp,
      fontFamily: 'AlexandriaFLF'
      ),
      toolbarHeight: 8.h,
    ),
    // main colors of the app
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.colorPrimary,
    primaryColorDark: AppColors.colorPrimary,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.white,

    ),
    //icon theme
    iconTheme: const IconThemeData(color: AppColors.colorPrimary),
    // ripple color
    splashColor: Colors.transparent,
    // Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        buttonColor: AppColors.colorPrimary,
        splashColor: AppColors.colorPrimary.withOpacity(0.7)),
    fontFamily: 'AlexandriaFLF',
    // Text theme
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 12.sp, color: AppColors.textColorPrimary),
      bodyMedium: TextStyle(fontSize: 10.sp, color: AppColors.textColorSecondary),
      displayLarge: TextStyle(fontSize: 24.sp, color: AppColors.textColorPrimary),
      displayMedium: TextStyle(fontSize: 20.sp, color: AppColors.textColorPrimary),
      displaySmall: TextStyle(fontSize: 18.sp, color: AppColors.textColorPrimary),
      headlineMedium: TextStyle(fontSize: 14.sp, color: AppColors.textColorPrimary),
      headlineSmall: TextStyle(fontSize: 13.sp, color: AppColors.textColorPrimary),
      titleLarge: TextStyle(fontSize: 12.sp, color: AppColors.textColorPrimary),
      titleMedium: TextStyle(fontSize: 11.sp, color: AppColors.textColorPrimary),
      titleSmall: TextStyle(fontSize: 10.sp, color: AppColors.textColorPrimary),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders:
      {
          TargetPlatform.android:  OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS:  CupertinoPageTransitionsBuilder(),
       },
    ),
  );
}
