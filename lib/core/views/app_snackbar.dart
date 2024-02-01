import 'package:ali_fouad_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AppSnackBar{
  static show({required String message , bool error = false , String? title}) {
  return Get.showSnackbar( 
           GetSnackBar(
          title:  title?? (error ? "Error" : "Success"),
          message: message ,
          duration:  Duration(
          seconds: error? 3 : 3
        ),
        backgroundColor: error ? Colors.red : AppColors.snackBackgroundColor,
        margin: EdgeInsets.symmetric(vertical: 2.h , horizontal: 4.w),
        borderRadius: 15,
        )
        );
}
}