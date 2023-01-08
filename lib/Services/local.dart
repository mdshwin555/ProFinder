import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      "appointment": "Appointment with \n a expert",
      "type-1": "User",
      "light": "Dark mood",
      "arabic": "🇸🇦",
      "english": "🇱🇷",
    },
    "ar": {
      "appointment": "احجز موعد مع خبير",
      "type-1": "مستخدم عادي",
      "light": "الوضع الليلي",
      "arabic": "🇸🇦",
      "english": "🇱🇷",
    }
  };
}






