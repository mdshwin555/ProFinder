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
            top: 0,
            child: Image.asset(
              Images.header,
              width: 100.w,
            ),
          ),
          Positioned(
            top: 13.h,
            left: 35.w,
            child: Image.asset(
              Images.logo,
              height: 15.h,
            ),
          ),
          Positioned(
            top: 24.h,
            left: 38.w,
            child: Text(
              'Expertio',
              style: TextStyle(
                fontFamily: Fonts.c,
                color: Color(color.blue),
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 31.h,
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
            top: 35.h,
            left: 25.w,
            child: Text(
              'Choose who are you ',
              style: TextStyle(
                color: Color(color.blue),
                fontSize: 15.sp,
                fontFamily: Fonts.a,
              ),
            ),
          ),
          // Positioned(
          //   top: 37.h,
          //   left: 15.w,
          //   child: Container(
          //     height: 30.h,
          //     child: Image.asset(
          //       Images.choose,
          //       height: 20.w,
          //     ),
          //   ),
          // ),

          Positioned(
            top: 43.h,
            left: 7.w,
            child: CustomButtom(
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
            bottom: -35.h,
            left: -65.w,
            child: CircleAvatar(
              backgroundColor: Color(color.orange),
              radius: 200.sp,
            ),
          ),
          Positioned(
            bottom: 3.h,
            left: 18.w,
            child: Lottie.asset(
              Images.think,
              height: 35.h,
            ),
          ),
        ],
      ),
    );
  }
}
