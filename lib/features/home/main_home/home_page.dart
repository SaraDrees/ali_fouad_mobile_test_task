import 'package:ali_fouad_app/core/app_colors.dart';
import 'package:ali_fouad_app/core/services/widget_state_widget.dart';
import 'package:ali_fouad_app/core/views/loading_widget.dart';
import 'package:ali_fouad_app/features/home/main_home/home_controller.dart';
import 'package:ali_fouad_app/features/home/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController>{
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Home Page",)
      ),
      body: StateBuilder<HomeController>(
        id: 'home',
        // initialWidgetState: WidgetState.loaded,
        disableState: true,
        builder: (widgetState, controller){
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 2.w,),
                        const Icon(Icons.person_outlined, size: 26,),
                        SizedBox(width: 5.w,),
                        Text(controller.user?.name??"_ _ _ _ _" , style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textColorSecondary, fontWeight: FontWeight.bold
                        )),
                      ]),
                      SizedBox(height: 2.h,),
                    Row(
                      children: [
                        SizedBox(width: 2.w,),
                        const Icon(Icons.phone_android, size: 26,),
                        SizedBox(width: 5.w,),
                        Text("${controller.user?.countryCode??"+ _ _ _ "}${controller.user?.phone??"_ _ _ _ _ _ _ _ _ _"}" , style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textColorSecondary, fontWeight: FontWeight.bold
                        )),
                      ]),
                      SizedBox(height: 2.h,),
                    Row(
                      children: [
                        SizedBox(width: 2.w,),
                        const Icon(Icons.email_outlined, size: 26,),
                        SizedBox(width: 5.w,),
                        Text(controller.user?.email??"_ _ @ _ _ _ . _ _" , style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textColorSecondary, fontWeight: FontWeight.bold
                        )),
                      ]),            
                    SizedBox(height: 3.h,),
                    Expanded(
                      child: AnimatedList(
                        key: controller.animatedListKey,
                        initialItemCount: controller.options.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index, animation) => _buildOptionCard(controller.options[index]["title"],
                         controller.options[index]["onPressed"], animation),
                      ),
                    )
                  
                  ],
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
      )
    );
  }

  _buildOptionCard(String title , Function() onPressed , Animation<double> animation)=>
   OptionCard(title: title, onPressed: onPressed, animation: animation);
}