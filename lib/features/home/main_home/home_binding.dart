import 'package:ali_fouad_app/core/services/service_storage.dart';
import 'package:ali_fouad_app/features/home/main_home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => HomeController(appRepository: Get.find(), sharedPreferences: Get.find<StorageService>().sharedPreferences));
  }
}