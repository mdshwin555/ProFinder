import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      "login-title": "Login",
      "type-1": "User",
      "type-2": "Admin",
      "arabic": "🇸🇦",
      "english": "🇱🇷",
    },
    "ar": {
      "login-title": "تسجيل الدخول",
      "type-1": "مستخدم عادي",
      "type-2": "أدمن",
      "arabic": "🇸🇦",
      "english": "🇱🇷",
    }
  };
}






