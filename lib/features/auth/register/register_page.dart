import 'package:ali_fouad_app/core/assets.dart';
import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/widget_state_widget.dart';
import 'package:ali_fouad_app/core/utitlities.dart';
import 'package:ali_fouad_app/core/views/app_button_widget.dart';
import 'package:ali_fouad_app/core/views/app_text_field.dart';
import 'package:ali_fouad_app/core/views/loading_widget.dart';
import 'package:ali_fouad_app/features/auth/register/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class RegisterPage extends GetView<RegisterController>{
   RegisterPage({super.key});
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StateBuilder<RegisterController>(
        id: "register",
        initialWidgetState: WidgetState.loaded,
        disableState: true,
        builder: (widgetState, controller){
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 100.h,
                  margin: EdgeInsets.symmetric(horizontal:15.w ).copyWith(
                  top: 10.h,bottom: 2.h ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(Assets.logo,height:14.h,),
                        SizedBox(height:2.h),
                        Center(
                          child: Text("Register", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold
                          )),
                        ),
                        SizedBox(height: 6.h),
                        AppTextField(controller: nameController, hintText: "Full Name",
                        validator: (value) => filedRequired(value)),
                        SizedBox(height: 1.h),
                        AppTextField(controller: phoneController, hintText: "55994435",
                        keyboardType: TextInputType.phone,
                        validator: (value) => filedRequired(value),
                        prefixIcon: Image.asset(Assets.countryIcon,scale: 6 , alignment: Alignment.centerRight)),
                        SizedBox(height: 1.h),
                        AppTextField(controller: emailController, hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => filedRequired(value),),
                        SizedBox(height: 1.h),
                        AppTextField(controller: passwordController, hintText: "Password",
                        validator: (value) => filedRequired(value),
                        isPassword: controller.isPassword[0] , suffixIcon: InkWell(
                        onTap: () => controller.showPassword(0),
                        child: controller.isPassword[0]? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),),
                        SizedBox(height: 1.h),
                        AppTextField(controller: confirmPasswordController, hintText: "Confirm Password",
                        validator: (value) {
                          if(filedRequired(value) == null ){
                          if(confirmPasswordController.text != passwordController.text){
                            return "this value doesn't match password";
                          }} return null;},
                        isPassword: controller.isPassword[1] , suffixIcon: InkWell(
                                    onTap: () => controller.showPassword(1),
                                    child: controller.isPassword[1]? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),),
                        SizedBox(height: 5.h,),
                        AppButtonWidget(text: "Register",
                         onPressed: () {
                            if(_formKey.currentState!.validate())
                          {controller.user = User(
                            name: nameController.text, password: passwordController.text, phone: phoneController.text,
                            email: emailController.text , passwordConfirm: confirmPasswordController.text,
                            countryCode: "+971"
                          );
                            controller.register();}
                         },),
                         const Expanded(child: SizedBox()),
                         Text.rich(TextSpan(
                          children: [
                            TextSpan(text:"Already have an account?", style: Theme.of(context).textTheme.titleMedium),
                            TextSpan(text:" Login", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                            ..onTap =() => Get.offAllNamed(AppRoutes.loginPageRoute))
                          ]
                         ))
                      ],
                    ),
                  ),
                ),
              ),
             Visibility(
                visible: widgetState == WidgetState.loading,
                child: Container(
                  height: 100.h,
                  decoration:  const BoxDecoration(color: Colors.white60),
                  child: const LoadingWidget()),
              )
            ],
          );
        }
      ),
    );
  }
}