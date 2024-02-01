import 'dart:convert';

import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/repository.dart';
import 'package:ali_fouad_app/core/services/request_mixin.dart';
import 'package:ali_fouad_app/core/services/state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxStateController{
  AppRepository appRepository;
  SharedPreferences sharedPreferences;

  HomeController({required this.appRepository, required this.sharedPreferences});
   User? user;

   // for animated list
  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
   List items = [];
    List options = [];
    int i = 0;

  

  @override
  void onInit() {
    getUserInfo();
    items = [
    {"title": "Update Information", "onPressed": () => Get.toNamed(AppRoutes.updateInformationPageRoute)?.then((value) => updateData(value))},
    {"title": "Change Password", "onPressed": () => null},
    {"title": "Delete Account", "onPressed": () => null},
    {"title": "Logout", "onPressed": () {
      sharedPreferences.remove("userInfo");
      Get.offAllNamed(AppRoutes.welcomePageRoute);}}];
    options.clear();
    initialItem();
    super.onInit();
  }

  void getUserInfo()async{
     await requestMethod(ids: ['home'], 
    requestType: RequestType.getData, 
    function: () async {
      !sharedPreferences.containsKey('userInfo') ? null :
      user = User.fromJson(jsonDecode(sharedPreferences.get('userInfo').toString()) as Map<String,dynamic>);
      await appRepository.getUser(userId: user?.id??"");
      return null;
    });
  }


  void initialItem() {
    Future.delayed(const Duration(milliseconds: 300),() {
    options.add(items[i]);
    animatedListKey.currentState!.insertItem(options.length-1);
     (i++) == items.length-1? null : initialItem();
    });
    }

    updateData(User updatedUser){
      user = updatedUser;
      update(['home']);
    }

}