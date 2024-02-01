import 'package:ali_fouad_app/core/assets.dart';
import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/widget_state_widget.dart';
import 'package:ali_fouad_app/core/utitlities.dart';
import 'package:ali_fouad_app/core/views/app_button_widget.dart';
import 'package:ali_fouad_app/core/views/app_text_field.dart';
import 'package:ali_fouad_app/core/views/loading_widget.dart';
import 'package:ali_fouad_app/features/auth/login/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetView<LoginController>{
   LoginPage({super.key});
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StateBuilder<LoginController>(
          id: "login",
          initialWidgetState: WidgetState.loaded,
          disableState: true,
          builder: (widgetState, controller) {
            return Stack(
              children: [
                Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(horizontal:15.w ).copyWith(
                  top: 10.h,bottom: 2.h ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset(Assets.logo,height:14.h,),
                        SizedBox(height:2.h),
                        Text("Login", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold
                        )),
                        SizedBox(height: 22.h),
                        AppTextField(controller: emailController, hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => filedRequired(value)),
                        SizedBox(height: 1.h),
                        AppTextField(controller: passwordController, hintText: "Password",
                        validator: (value) => filedRequired(value),
                        isPassword: controller.isPassword , suffixIcon: InkWell(
                                    onTap: () => controller.showPassword(),
                                    child: controller.isPassword? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),),
                        SizedBox(height: 5.h,),
                        AppButtonWidget(text: "Login",
                         onPressed: () {
                          if(_formKey.currentState!.validate()){
                            controller.user = User(email: emailController.text , password: passwordController.text);
                           controller.login();
                           }
                         },),
                         const Expanded(child: SizedBox()),
                         Text.rich(TextSpan(
                          children: [
                            TextSpan(text:"Don't have an account?", style: Theme.of(context).textTheme.titleMedium),
                            TextSpan(text:" Register", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                             ..onTap =() => Get.offAllNamed(AppRoutes.registerPageRoute)
                            )
                          ]
                         ))
                      ],
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
      ) ,
    );
  }
}