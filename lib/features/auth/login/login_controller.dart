import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/repository.dart';
import 'package:ali_fouad_app/core/services/request_mixin.dart';
import 'package:ali_fouad_app/core/services/state_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxStateController {
  
  final AppRepository appRepository;
  LoginController({required this.appRepository});

  bool isPassword = true;
  late User user;

  showPassword(){
    isPassword = !isPassword;
    update(['login']);
  }
  
  @override
  void onInit() {
    user = User();
    super.onInit();
  }

  void login() async {
   await requestMethod(ids: ['login'], 
    requestType: RequestType.postData, 
    function: () async {
     await appRepository.login(user) ;
      return null;
    });
      Get.offAllNamed(AppRoutes.homePageRoute);
  }

  
}