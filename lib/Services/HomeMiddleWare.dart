import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2022/main.dart';
import '../constants/routes.dart';

class HomeMiddleWare extends GetMiddleware{
  @override
  RouteSettings?redirect(String? route){
    if (sharedPref?.getString("role") == "experthome")
      return RouteSettings(name: Routes.Home);

    if (sharedPref?.getString("role") == "userhome")
      return RouteSettings(name: Routes.Home);
  }
}