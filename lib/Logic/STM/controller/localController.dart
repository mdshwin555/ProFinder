import 'dart:ui';
import 'package:get/get.dart';

import '../../../main.dart';




class localController extends GetxController {

  Locale initialLang =
  sharedPref?.getString("lang") == "ar" ? Locale("ar") : Locale("en");

  changeLang(String codeLang) {
    Locale local = Locale(codeLang);
    sharedPref?.setString("lang", codeLang);
    Get.updateLocale(local);
  }
}
