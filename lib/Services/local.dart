import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      "login-title": "Login",
      "type-1": "User",
      "light": "Dark mood",
      "arabic": "🇸🇦",
      "english": "🇱🇷",
    },
    "ar": {
      "login-title": "تسجيل الدخول",
      "type-1": "مستخدم عادي",
      "light": "الوضع الليلي",
      "arabic": "🇸🇦",
      "english": "🇱🇷",
    }
  };
}






