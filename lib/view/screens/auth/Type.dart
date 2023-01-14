import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/view/widgets/Buttoms.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import 'package:project2022/constants/colors.dart';
import '../../../constants/routes.dart';

class Type extends StatefulWidget {
  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  int currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top:2.h,
            child: Transform.scale(
              scale: 0.2.h,
              child: Lottie.asset(
                Images.header2,
                height: 20.h,
                width: 100.w,
              ),
            ),
          ),
          Positioned(
            top: 26.h,
            left: 5.w,
            child: Text(
              'want help from an expert ?',
              style: TextStyle(
                color: Color(color.blue),
                fontSize: 20.sp,
                fontFamily: Fonts.a,
              ),
            ),
          ),
          Positioned(
            top: 31.h,
            left: 23.w,
            child: Text(
              'Choose who are you please',
              style: TextStyle(
                color: Color(color.blue),
                fontSize: 15.sp,
                fontFamily: Fonts.h,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            top: 43.h,
            left: 7.w,
            child:
            CustomButtom(
              font: Fonts.g,
              role: "Expert",
              color: color.orange,
              text: 'Expert',
              route: Routes.Login,
            ),
          ),
          Positioned(
            top: 54.h,
            left: 7.w,
            child: CustomButtom(
              font: Fonts.g,
              role: "User",
              color: color.white,
              text: 'User',
              route: Routes.Login,
            ),
          ),

          Positioned(
            bottom: -10.h,
            left: -40.w,
            child: Lottie.asset(
              Images.footer,
              height: 35.h,
            ),
          ),
        ],
      ),
    );
  }
}
