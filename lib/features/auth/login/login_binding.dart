import 'package:ali_fouad_app/features/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(appRepository: Get.find()));
  }
}