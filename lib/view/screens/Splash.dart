import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2022/main.dart';
import 'package:project2022/view/screens/user/Home.dart';
import 'package:project2022/view/screens/auth/Type.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/images.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        AnimatedSplashScreen(
          splashIconSize: Get.height,
          splash: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -15.h,
                right: -30.w,
                child: CircleAvatar(
                  backgroundColor: Color(color.orange),
                  radius: 100.sp,
                ),
              ),
              Positioned(
                bottom: -30.h,
                left: -60.w,
                child: CircleAvatar(
                  backgroundColor: Color(color.orange),
                  radius: 200.sp,
                ),
              ),
              Positioned(
                top: 40.h,
                left: 31.w,
                child: Text(
                  'Expertio',
                  style: TextStyle(
                    fontFamily: Fonts.c,
                    color: Color(color.blue),
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 47.h,
                left: 21.w,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Color(color.blue),
                    fontFamily: Fonts.e,
                    fontSize: 13.sp,
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText('Find your experts now'),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20.h,
                left: 23.w,
                child: Image.asset(
                  Images.logo,
                  height: 25.h,
                ),
              ),

              // Image.asset(
              //   Images.splash,
              //   height: Get.height,
              //   width: Get.width,
              //   fit: BoxFit.fill,
              // ),
              // Container(
              //   height: 200,
              //   width: 200,
              //   child: Image.asset(
              //     //repeat: false,
              //     Images.expert,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              // Positioned(
              //   top: Get.height - 340,
              //   child: Text(
              //     "Find Experts",
              //     style: TextStyle(
              //       fontSize: 35,
              //       color: Colors.white,
              //       //fontFamily: "dr"
              //     ),
              //   ),
              // ),
            ],
          ),
          nextScreen: sharedPref?.getString("role") == null ? Type() : Home(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 10000000,
        ),
      ]),
    );
  }
}
