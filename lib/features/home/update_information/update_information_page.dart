import 'package:ali_fouad_app/core/assets.dart';
import 'package:ali_fouad_app/core/services/widget_state_widget.dart';
import 'package:ali_fouad_app/core/utitlities.dart';
import 'package:ali_fouad_app/core/views/app_button_widget.dart';
import 'package:ali_fouad_app/core/views/app_text_field.dart';
import 'package:ali_fouad_app/core/views/loading_widget.dart';
import 'package:ali_fouad_app/features/home/update_information/update_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UpdateInformationPage extends GetView<UpdateInformationController>{
   UpdateInformationPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Update Information",)
      ),
      body: StateBuilder<UpdateInformationController>(
        id: "update_info",
        initialWidgetState: WidgetState.loaded,
        disableState: true,
        builder: (widgetState, controller){
          return Stack(
            children: [
              Container(
                height: 100.h,
                margin: EdgeInsets.symmetric(horizontal:15.w ).copyWith(
                top: 3.h,bottom: 2.h ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(controller: controller.nameController, hintText: "Full Name",
                       validator: (value) => filedRequired(value) ,
                      ),
                      SizedBox(height: 1.h),
                      AppTextField(controller: controller.phoneController, hintText: "55994435",
                      keyboardType: TextInputType.phone,
                      validator: (value) => filedRequired(value),
                      prefixIcon: Image.asset(Assets.countryIcon,scale: 6 , alignment: Alignment.centerRight)),
                      SizedBox(height: 1.h),
                      AppTextField(controller: controller.emailController, hintText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => filedRequired(value),
                      ),
                      SizedBox(height: 3.h,),
                      AppButtonWidget(text: "Save",
                       onPressed: () {
                        if(_formKey.currentState!.validate()){
                        controller.updateInformation();
                        }
                       },),
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
    );
  }
}