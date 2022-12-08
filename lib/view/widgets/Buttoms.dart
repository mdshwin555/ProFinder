import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';


class CustomButtom extends StatelessWidget {
  final int color;
  final String text;
  final String route;
  final String role;
  final String font;

  CustomButtom({
    required this.color,
    required this.text,
    required this.route,
    required this.role,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
        sharedPref?.setString("role", role);
      },
      child: Container(
        alignment: Alignment.center,
        height: 8.h,
        width: 85.w,
        decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
              decoration: TextDecoration.none,
            color: color == 0xffF9A826 ? Color(0xff1E2738) : Color(0xffffffff),
            fontSize: 20.sp,
            fontFamily: font
          ),
        ),
      ),
    );
  }
}
