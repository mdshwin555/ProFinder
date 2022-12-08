import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
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
      body: Column(
        children: [
          Image.asset(
            Images.header,
            width: 100.w,
          ),
          Text(
            'Choose login method',
            style: TextStyle(
              color: Color(color.blue),
              fontSize: 20.sp,
              fontFamily: Fonts.g,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Image.asset(
            Images.choose,
            width: 100.w,
          ),
          SizedBox(
            height: 1.h,
          ),

          CustomButtom(
            font: Fonts.g,
            role: "Expert",
            color: color.orange,
            text: 'Expert',
            route: Routes.Login,
          ),
          SizedBox(
            height: 3.h,
          ),
          CustomButtom(
            font: Fonts.g,
            role: "User",
            color: color.blue,
            text: 'User',
            route: Routes.Login,
          ),
        ],
      ),
    );
  }
}
