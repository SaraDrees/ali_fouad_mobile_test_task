import 'package:ali_fouad_app/features/auth/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(appRepository: Get.find()));
  }
}