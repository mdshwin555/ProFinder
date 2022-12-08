import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/HomeController.dart';
import 'package:project2022/constants/colors.dart';
import 'FavoriteScreen.dart';
import 'ProfileScreen.dart';
import 'mainscreen.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: homeController.pageController,
        children: [
          ProfileScreen(),
          MainScreen(),
          FavoriteScreen(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: Color(color.blue),
          ),
        ),
        child: GetX<HomeController>(
          builder: (controller) {
            return CircleNavBar(
              cornerRadius: BorderRadius.vertical(
                top: Radius.circular(30.sp),
                bottom: Radius.circular(30.sp),
              ),
              padding: EdgeInsets.only(
                bottom: 2.h,
                left: 3.w,
                right: 3.w
              ),
              circleColor: Color(color.orange),
              activeIcons: [
                Icon(Icons.settings),
                Icon(CupertinoIcons.house_fill),
                Icon(CupertinoIcons.heart_fill)
              ],
              inactiveIcons: const [
                Icon(
                  Icons.settings_outlined,
                  color: Color(color.blue),
                ),
                Icon(
                  CupertinoIcons.house,
                  color: Color(color.blue),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Color(color.blue),
                )
              ],
              color: Color(color.orange),
              height: 8.h,
              activeIndex: controller.pageInx.value,
              circleWidth: 8.h,
              onTap: (val) {
                controller.toPage(val);
              },
              iconDurationMillSec: 400,
              tabCurve: Curves.easeOutQuart,
            );
          },
        ),
      ),
    );
  }
}
