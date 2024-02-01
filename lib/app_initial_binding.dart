import 'package:ali_fouad_app/core/dio/factory.dart';
import 'package:ali_fouad_app/core/services/service_storage.dart';
import 'package:get/get.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      StorageService.instance,
      permanent: true,
    );
    Get.put(
      DioFactory.dioSetUp(),
      permanent: true,
    );
    
  }
  
  //  getSharedPreferences() async{
  //   final pref = await SharedPreferences.getInstance();
  //   return pref;
  // }


}
