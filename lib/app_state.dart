import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final currentUnit = 0.obs;
  final isDarkMode = false.obs;
  @override
  void onInit() {
    isDarkMode.value = GetStorage().read('isDarkMode') ?? false;
    print(isDarkMode.value);
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
    update();
    super.onInit();
  }

  void onChangeUnit(value) {
    currentUnit.value = value;
  }

  void resetUnit() {
    currentUnit.value = 0;
  }

  void changeTheme(bool value) async {
    Get.changeTheme(isDarkMode.value ? ThemeData.light() : ThemeData.dark());
    isDarkMode.value = value;
    update();
    print("Lưu: ${isDarkMode.value}");
    await GetStorage().write('isDarkMode', isDarkMode.value);
  }

  void logout() async {
   
  }

}
