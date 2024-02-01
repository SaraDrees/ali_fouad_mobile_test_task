import 'package:ali_fouad_app/core/app_colors.dart';
import 'package:ali_fouad_app/core/assets.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/widget_state_widget.dart';
import 'package:ali_fouad_app/core/views/app_button_widget.dart';
import 'package:ali_fouad_app/features/auth/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends GetView<WelcomeController>{
   const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal:15.w ).copyWith(
          top: 10.h,bottom: 2.h ),
          child: StateBuilder<WelcomeController>(
            id: "welcome",
            initialWidgetState: WidgetState.loaded,
            disableState: true,
            builder: (widgetState, controller) {
              return Column(
                children: [
                  Image.asset(Assets.logo,height:14.h,),
                  SizedBox(height:3.h),
                  Text("Welcome to the app", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 25.h),
                  AppButtonWidget(text: "Login",
                   onPressed: () {
                    Get.offAllNamed(AppRoutes.loginPageRoute);
                   },),
                  SizedBox(height: 2.h), 
                  AppButtonWidget(text: "Register",
                  color: AppColors.whiteColor,
                  buttonTextColor: AppColors.colorPrimary,
                   onPressed: () {
                    Get.offAllNamed(AppRoutes.registerPageRoute);
                   },),
                   const Expanded(child: SizedBox()),
                   Text.rich(TextSpan(
                    children: [
                      TextSpan(text:"Disginec & Developed by", style: Theme.of(context).textTheme.titleMedium),
                      TextSpan(text:" Ali Fouad", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                      )
                    ]
                   ))
                ],
              );
            }
          ),
        ),
      ) ,
    );
  }
}