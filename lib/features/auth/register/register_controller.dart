import 'package:ali_fouad_app/core/models/user.dart';
import 'package:ali_fouad_app/core/routing/routes.dart';
import 'package:ali_fouad_app/core/services/repository.dart';
import 'package:ali_fouad_app/core/services/request_mixin.dart';
import 'package:ali_fouad_app/core/services/state_mixin.dart';
import 'package:get/get.dart';

class RegisterController extends GetxStateController {
  
  final AppRepository appRepository;
  RegisterController({required this.appRepository});

  List<bool> isPassword = [true,true];
  late User user ;

  showPassword(int i){
    isPassword[i] = !isPassword[i];
    update(['register']);
  }
  
  @override
  void onInit() {
    user = User();
    super.onInit();
  }

  void register() async {
   await requestMethod(ids: ['register'], 
    requestType: RequestType.postData, 
    function: () async {
    await appRepository.register(user);
    return null;
    });
    Get.offAllNamed(AppRoutes.homePageRoute);
  }

  
}