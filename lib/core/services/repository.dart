import 'dart:convert';

import 'package:ali_fouad_app/core/dio/dio_controller.dart';
import 'package:ali_fouad_app/core/exceptions/exceptions.dart';
import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/views/app_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepository{
  final Dio dio;
  final SharedPreferences sharedPreferences;
  AppRepository({required this.dio,required this.sharedPreferences });

   Future register(User user) async {
    try {
      final result = await dio.post("${DioController.baseUrl}/user/register",
      data: user.toJson());
      sharedPreferences.setString("userInfo", jsonEncode(result.data['data']));
    } catch (error) {
      AppSnackBar.show(message: "${(error as DioException).message}",
       title:"Register failed .. the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }

  Future login(User user) async {
    try {
      final result = await dio.post("${DioController.baseUrl}/login",
      queryParameters: user.toJson());
      sharedPreferences.setString("userInfo", jsonEncode(result.data['data']));
    } catch (error) {
      AppSnackBar.show(message: "${(error as DioException).message}",
       title:"login failed .. the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }


  Future<List<User>?> getUsers() async {
    try {
      final result = await dio.get("${DioController.baseUrl}/users");
      debugPrint("$result");
      return userFromJson(result.data['data']) ;
    } catch (error) {
      AppSnackBar.show(message: "${(error as DioException).message}",
       title:"getUsers failed .. the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }

  Future<User?> getUser({required String userId}) async {
    try {
      final result = await dio.get("${DioController.baseUrl}/user/$userId");
      return User.fromJson(result.data['data']);
    } catch (error) {
      AppSnackBar.show(message: "${(error as DioException).message}",
       title:"get User-Info failed .. the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }
 
 Future updateUser(User user) async {
    try {
      await dio.post("${DioController.baseUrl}/user/update",
      data: user.toJson());
    } catch (error) {
      Get.back();
      AppSnackBar.show(message: "${(error as DioException).message}", 
      title:"update Info failed .. the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }
  Future changePassword(User user) async {
    try {
      await dio.post("${DioController.baseUrl}/user/changepassword",
      data: user.toJson());
    } catch (error) {
      AppSnackBar.show(message: "${(error as DioException).message}", title:"the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }
  Future deleteUser() async {
    try {
      await dio.delete("${DioController.baseUrl}/user/delete",
      data: {});
    } catch (error) {
      AppSnackBar.show(message: "${(error as DioException).message}", title:"the app in test mode now", error: true);
      throw ExceptionHandler(error);
    }
  }
  
}