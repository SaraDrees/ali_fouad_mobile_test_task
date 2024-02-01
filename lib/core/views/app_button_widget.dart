import 'package:ali_fouad_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppButtonWidget extends StatelessWidget {
   AppButtonWidget({this.height, this.width , this.color, this.buttonTextColor, this.borderColor, required this.text ,required this.onPressed ,super.key});
   Color ?color;
   Color? buttonTextColor;
   Color? borderColor;
  double ? height,width;
  String text;
  final Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                width: 100.w,
                height: height?? 6.5.h,
                child: ElevatedButton(
                  onPressed:() => onPressed(),
                 style: ElevatedButton.styleFrom(
                  elevation: 1,
                  foregroundColor: buttonTextColor?? AppColors.buttonTextColor,
                  backgroundColor: color??AppColors.colorPrimary,
                  shape: RoundedRectangleBorder(side: BorderSide(color: borderColor??AppColors.colorPrimary ),borderRadius: BorderRadius.circular(15),)
                 ),
                  child: Text(
                  text,
                  style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  ),
                  ),
                 ),
              )
           ;
  }
}