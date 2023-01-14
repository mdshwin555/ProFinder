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

import 'onboarding.dart';

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
                top: -20.h,
                right: -35.w,
                child: CircleAvatar(
                  backgroundColor: Color(color.orange),
                  radius: 100.sp,
                ),
              ),
              Positioned(
                bottom: -29.h,
                left: -53.w,
                child: CircleAvatar(
                  backgroundColor: Color(0xf01e3562),
                  radius: 200.sp,
                ),
              ),
              Positioned(
                top: 10.h,
                left: 20.w,
                child: CircleAvatar(
                  backgroundColor: Color(0xf01e3562),
                  radius: 22.sp,
                ),
              ),
              Positioned(
                bottom: 30.h,
                right: -5.w,
                child: CircleAvatar(
                  backgroundColor: Color(0xf0587fcc),
                  radius: 19.sp,
                ),
              ),
              Positioned(
                top: 47.h,
                left: 17.w,
                child: CircleAvatar(
                  backgroundColor: Color(0xedcc8a21),
                  radius: 10.sp,
                ),
              ),
              Positioned(
                bottom: -32.h,
                left: -59.w,
                child: CircleAvatar(
                  backgroundColor: Color(color.white),
                  radius: 200.sp,
                ),
              ),

              Positioned(
                bottom: -35.h,
                left: -65.w,
                child: CircleAvatar(
                  backgroundColor: Color(color.orange),
                  radius: 200.sp,
                ),
              ),
              Positioned(
                bottom: 5.h,
                left: 20.w,
                child: Container(
                  height: 11.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.sp),
                      bottomLeft: Radius.circular(10.sp),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 3.h,
                right: 5.w,
                child: Container(
                  height: 5.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.sp),
                      bottomRight: Radius.circular(10.sp),
                    ),
                  ),
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
                    pause: Duration(microseconds: 10),
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
            ],
          ),
          nextScreen: sharedPref?.getString("role") == null ?  sharedPref?.getString("onboarding")=="true"?Type():OnBoarding() : Home(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 1000,
        ),
      ]),
    );
  }
}
