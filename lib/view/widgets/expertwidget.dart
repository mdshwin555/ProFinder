import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/Logic/Api/Models/expertmodel.dart';
import 'package:sizer/sizer.dart';
import '../../Logic/Api/Models/expertmodel.dart';
import '../../Logic/Api/Models/expertmodel.dart';
import '../../constants/fonts.dart';
import '../../constants/images.dart';
import '../../constants/routes.dart';
import 'package:project2022/constants/colors.dart';
import 'package:project2022/constants/fonts.dart';

class ExpertWidget extends StatelessWidget {

  final expertmodel model;

  ExpertWidget(this.model);

  List images = [
    Images.medical,
    Images.proffisional,
    Images.mental,
    Images.family,
    Images.business,
  ];

  List titles = [
    'Medical',
    'professional',
    'Mental',
    'familial',
    'Business',
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 5.sp,
      borderRadius: BorderRadius.circular(50.sp),
      onTap: () {
        Get.toNamed(Routes.expertDetails);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 3.w,
          right: 3.w,
          top: 2.h,
          bottom: 2.h,
        ),
        width: 25.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.sp,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          color: Color(color.white),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Lottie.asset(
              model.photo!,
              alignment: Alignment.center,
              height: 7.h,
            ),
            Positioned(
              bottom: 12,
              child: Text(
                model.name!,
                style: TextStyle(
                  fontFamily: Fonts.a,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                  color: Color(color.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
