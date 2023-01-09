import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      "appointment": "Appointment with \n an expert",
      "search": "Search for expert",
      "light": "Dark mood",
      "hcwhy": "How can we help you ?",
      "AllE": "All Experts",
      "lang": "Language",
      "logout": "logout",
    },
    "ar": {
      "appointment": "احجز موعد مع خبير",
      "search": "إبحث عن خبير",
      "light": "الوضع الليلي",
      "hcwhy": " كيف نستطيع مساعدتك ؟",
      "AllE": "كل الخبراء",
      "lang": "لغة التبيق",
      "logout": "تسجيل الخروج",
    }
  };
}






