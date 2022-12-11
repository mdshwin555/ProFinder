import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:project2022/constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import '../../../constants/routes.dart';
import '../../../main.dart';
import 'package:project2022/constants/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainScreen extends StatelessWidget {
  List titles = [
    'Medical',
    'professional',
    'Mental',
    'familial',
    'Business',
  ];

  List rates = [
    '8',
    '7.5',
    '9',
    '5',
    '10',
  ];

  List images = [
    Images.medical,
    Images.proffisional,
    Images.mental,
    Images.family,
    Images.business,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: Container(
              height: 37.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      Images.two,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.sp),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 75.w),
                  child: Container(
                    height: 6.h,
                    width: 13.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Color(color.blue),
                    ),
                    child: IconButton(
                      color: Color(color.yellow),
                      onPressed: () {
                        sharedPref?.clear();
                        Get.dialog(
                          Container(
                            padding: EdgeInsets.only(bottom: 16.h),
                            height: 50.h,
                            width: 90.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 38.h,
                                  child: Container(
                                    height: 40.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(25.sp),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.only(top: 11.h),
                                      child: Column(
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            'Oh no you\'re leaving \n are you sure ? ',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              color: Color(color.blue),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              sharedPref
                                                          ?.getString("role") ==
                                                      "userhome"
                                                  ? sharedPref?.setString(
                                                      "role", "User")
                                                  : sharedPref?.setString(
                                                      "role", "Expert");
                                              Get.toNamed(Routes.Login);
                                              sharedPref?.clear();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: 7.w,
                                                right: 7.w,
                                              ),
                                              alignment: Alignment.center,
                                              height: 8.h,
                                              width: 78.w,
                                              decoration: BoxDecoration(
                                                color: Color(color.orange),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Text(
                                                'Yes, Log me out',
                                                style: TextStyle(
                                                  color: Color(color.blue),
                                                  fontSize: 20.sp,
                                                  fontFamily: Fonts.a,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: 7.w,
                                                right: 7.w,
                                              ),
                                              alignment: Alignment.center,
                                              height: 8.h,
                                              width: 78.w,
                                              decoration: BoxDecoration(
                                                color: Color(color.blue),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Text(
                                                'No, just kidding',
                                                style: TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontSize: 20.sp,
                                                  fontFamily: Fonts.a,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 50.sp,
                                  backgroundColor: Color(color.orange),
                                  child: Text(
                                    '!',
                                    style: TextStyle(
                                        fontSize: 50.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(color.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        //Get.offNamed(Routes.typeScreen);
                      },
                      icon: Icon(
                        Icons.logout,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    right: 15.w,
                  ),
                  child: Text(
                    'Appoitment with \n a expert',
                    style: TextStyle(
                      letterSpacing: 0.8,
                      fontFamily: Fonts.c,
                      fontSize: 30.sp,
                      color: Color(color.blue),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2.h, left: 7.w),
                      height: 6.5.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.sp,
                        ),
                        color: Colors.white.withOpacity(0.60),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Serach for experts'),
                            SizedBox(
                              width: 32.4.w,
                            ),
                            Container(
                              height: 6.5.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(15.sp),
                                ),
                                color: Color(color.blue),
                              ),
                              child: Icon(
                                Icons.tune,
                                size: 25.sp,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    top: 7.h,
                    left: 5.w,
                  ),
                  child: Text(
                    'How can we help you ?',
                    style: TextStyle(
                      fontFamily: Fonts.h,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: Color(color.blue),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 2.w,
                  ),
                  margin: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                  ),
                  height: 14.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (c, i) {
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
                                images[i],
                                alignment: Alignment.center,
                                height: 7.h,
                              ),
                              Positioned(
                                bottom: 12,
                                child: Text(
                                  titles[i],
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
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 1.w,
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    top: 1.h,
                    left: 5.w,
                  ),
                  child: Text(
                    'Popular Experts ',
                    style: TextStyle(
                      fontFamily: Fonts.h,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: Color(color.blue),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                  ),
                  margin: EdgeInsets.only(
                    left: 1.w,
                    right: 1.w,
                    top: 0.5.h,
                  ),
                  height: 32.h,
                  child: GridView.custom(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    gridDelegate: SliverWovenGridDelegate.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      pattern: [
                        WovenGridTile(1),
                        WovenGridTile(
                          5 / 7,
                          crossAxisRatio: 0.9,
                          alignment: AlignmentDirectional.centerEnd,
                        ),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/${Random().nextInt(20) + 100}/${Random().nextInt(30) + 80}",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.75),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: 2.5.h,
                                right: 25.w,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Text(
                                    'Hello',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: Fonts.a,
                                    ),
                                  ),
                                  Text(
                                    '7/10 ⭐️',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
