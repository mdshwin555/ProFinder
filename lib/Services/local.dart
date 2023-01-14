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
      "times": "your reserved times :",
      "noreserv": "No reservations yet",
      "noitems": "No items yet in this consulting",
      "nosearch": "There is no expert with this name",
      "phone":"Phone",
      "address":"address",
      "Experiences":"Experiences",
      "Experience":"Experience",
      "Details":"Details",
      "timesexpert":"Times",
    },
    "ar": {
      "appointment": "احجز موعد مع خبير",
      "search": "إبحث عن خبير",
      "light": "الوضع الليلي",
      "hcwhy": " كيف نستطيع مساعدتك ؟",
      "AllE": "كل الخبراء",
      "lang": "لغة التبيق",
      "logout": "تسجيل الخروج",
      "times": "الأوقات المحجوزة لديك :",
      "noreserv": "لا يوجد حجوزات لديك بعد",
      "noitems": "لا يوجد جبراء لهذه الإستشارة بعد",
      "nosearch": "لا يوجد خبير بهذا الاسم",
      "phone":"الموبايل",
      "address":"العنوان",
      "Experiences":"الخبرات",
      "Experience":"الخبرة",
      "Details":"التفاصيل",
      "timesexpert":"الأوقات المتاحة",
    }
  };
}






