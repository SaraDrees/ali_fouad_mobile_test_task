import 'package:ali_fouad_app/core/services/service_storage.dart';
import 'package:ali_fouad_app/features/home/update_information/update_information_controller.dart';
import 'package:get/get.dart';

class UpdateInformationBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => UpdateInformationController(appRepository: Get.find(),
    sharedPreferences: Get.find<StorageService>().sharedPreferences),fenix: true);
  }
}