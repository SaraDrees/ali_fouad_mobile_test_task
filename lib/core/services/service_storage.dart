

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._internal();
  static final StorageService instance = StorageService._internal();
   late SharedPreferences sharedPreferences ;  

     getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();}

  

  }

