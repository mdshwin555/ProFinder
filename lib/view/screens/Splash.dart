import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2022/main.dart';
import 'package:project2022/view/screens/user/Home.dart';
import 'package:project2022/view/screens/auth/Type.dart';
import '../../constants/images.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedSplashScreen(
        splashIconSize: Get.height,
        splash: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Images.splash,
              height: Get.height,
              width: Get.width,
              fit: BoxFit.fill,
            ),
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                //repeat: false,
                Images.expert,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: Get.height - 340,
              child: Text(
                "Find Experts",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  //fontFamily: "dr"
                ),
              ),
            ),
          ],
        ),
        nextScreen: sharedPref?.getString("role") == null ? Type() : Home(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1000,
      ),
    ]);
  }
}
