import 'dart:convert';

import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/services/repository.dart';
import 'package:ali_fouad_app/core/services/request_mixin.dart';
import 'package:ali_fouad_app/core/services/state_mixin.dart';
import 'package:ali_fouad_app/core/views/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateInformationController extends GetxStateController{
  AppRepository appRepository;
  final SharedPreferences sharedPreferences;

  UpdateInformationController({required this.appRepository, required this.sharedPreferences});
   User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    user = !sharedPreferences.containsKey("userInfo")? User(): 
    User.fromJson(jsonDecode(sharedPreferences.get("userInfo").toString()) as Map<String,dynamic>);
    nameController.text = user?.name??"test01 t";
    phoneController.text = user?.phone??"559944652";
    emailController.text = user?.email??"test@test.test";
    super.onInit();
  }

  void updateInformation() async {
   await requestMethod(ids: ['update_info'], 
    requestType: RequestType.postData, 
    function: () async {
      user?.name = nameController.text;
      user?.email = emailController.text;
      user?.phone = phoneController.text;
      await appRepository.updateUser(user!);
      // to change just the edited value
      final User data = User.fromJson(jsonDecode(sharedPreferences.get("userInfo").toString()) as Map<String,dynamic>);
      data.name = user?.name; data.email = user?.email; data.countryCode = user?.countryCode; data.phone = user?.phone;
      sharedPreferences.setString("userInfo", jsonEncode(data.toMap()));
      Get.back();
      AppSnackBar.show(message: "Your information is updated successfully");
      return null;
    });
  }

}