import 'package:ali_fouad_app/core/services/repository.dart';
import 'package:ali_fouad_app/core/services/service_storage.dart';
import 'package:ali_fouad_app/features/auth/welcome/welcome_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AppRepository(dio: Get.find<Dio>(), sharedPreferences: Get.find<StorageService>().sharedPreferences),permanent: true);
    Get.lazyPut(() => WelcomeController(appRepository: Get.find()));
  }
}