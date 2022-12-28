import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2022/main.dart';
import '../constants/routes.dart';

class LoginMiddleWare extends GetMiddleware{
  @override
RouteSettings?redirect(String? route){
    if (sharedPref?.getString("role") == "Expert")
      return RouteSettings(name: Routes.Login);

    if (sharedPref?.getString("role") == "User")
      return RouteSettings(name: Routes.Login);
  }
}

