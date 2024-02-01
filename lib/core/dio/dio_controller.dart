import 'dart:convert';

import 'package:ali_fouad_app/core/constant.dart';
import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/service_storage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioController {
  final Dio dio;
  SharedPreferences sharedPreferences = Get.find<StorageService>().sharedPreferences;

  static String baseUrl = Constant.baseUrl;
  DioController({
    required this.dio,
  });

  String checkToken(String uri){
     if(sharedPreferences.containsKey("userInfo")){
     final User userInfo = User.fromJson(jsonDecode(sharedPreferences.get("userInfo").toString()) as Map<String,dynamic>);
     if(DateTime.now().isAfter(userInfo.tokenExpiry??DateTime.now())){
        Get.offAllNamed(AppRoutes.welcomePageRoute);
      }else if(!withoutAuth.any((element) => uri.contains(element))){
      return userInfo.token??'';}
      }
      return '' ;
  }

  List<String> withoutAuth = [
   "${Constant.baseUrl}/api/login" , "${Constant.baseUrl}/api/user/register"
    ];

  }
