
import 'package:ali_fouad_app/app_initial_binding.dart';
import 'package:ali_fouad_app/core/constant.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/service_storage.dart';
import 'package:ali_fouad_app/core/theme_manager.dart';
import 'package:ali_fouad_app/features/auth/login/login_binding.dart';
import 'package:ali_fouad_app/features/auth/login/login_page.dart';
import 'package:ali_fouad_app/features/auth/register/register_binding.dart';
import 'package:ali_fouad_app/features/auth/register/register_page.dart';
import 'package:ali_fouad_app/features/auth/welcome/welcome_binding.dart';
import 'package:ali_fouad_app/features/auth/welcome/welcome_page.dart';
import 'package:ali_fouad_app/features/home/main_home/home_binding.dart';
import 'package:ali_fouad_app/features/home/main_home/home_page.dart';
import 'package:ali_fouad_app/features/home/update_information/update_information_binding.dart';
import 'package:ali_fouad_app/features/home/update_information/update_information_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

part 'package:ali_fouad_app/core/routing/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.instance.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: Constant.appName,
        locale: const Locale(
            'en', 'US'), // translations will be displayed in that locale
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        getPages: _AppPages.appPages,
        initialBinding: AppInitialBindings(),
      );
    }); }
}