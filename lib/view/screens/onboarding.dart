import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/images.dart';
import '../../Logic/STM/controller/onboarding.dart';
import '../../constants/fonts.dart';
import 'ListModel.dart';
import 'package:project2022/constants/colors.dart';

class OnBoarding extends GetView<OnboardingControllerImp> {
  @override
  Widget build(BuildContext context) {
    OnboardingControllerImp controller = Get.put(OnboardingControllerImp());
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors:[
                  Color(0xFFC779D0),
                  Color(0xFF4BC0C8),
                  Color(0xFFFEAC5E),
                  Color(0xFFFEAC5E),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Get.height * 0.15,
            ),
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.lottieController,
              onPageChanged: (val) {
                controller.onPageChanged(val);
              },
              itemCount: onBoardingList.length,
              itemBuilder: (c, i) {
                return Column(
                  children: [
                    Lottie.asset(
                      "${onBoardingList[i].image}",
                      height: Get.height * 0.3,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Get.height * 0.55,
            ),
            height: Get.width * 0.9,
            width: Get.width * 0.89,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(75),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: GetBuilder<OnboardingControllerImp>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          onBoardingList.length,
                          (index) => AnimatedContainer(
                            margin: EdgeInsets.only(right: 4),
                            duration: const Duration(milliseconds: 300),
                            height: 13,
                            width: controller.currentPage == index ? 20 : 13,
                            decoration: BoxDecoration(
                              color: controller.currentPage == index
                                  ?  Color(color.orange)
                                  : Color.fromARGB(255, 176, 160, 160),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (val) {
                      controller.onPageChanged(val);
                    },
                    itemCount: onBoardingList.length,
                    itemBuilder: (c, i) {
                      return Container(
                        margin: EdgeInsets.only(
                            // bottom: 5,
                            ),
                        child: Column(
                          children: [
                            Text(
                              "${onBoardingList[i].title}",
                              style: TextStyle(
                                //fontFamily: "font1",
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.i,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "${onBoardingList[i].describtion}",
                                style: TextStyle(
                                    fontFamily:Fonts.h,
                                    fontSize: 15.sp,
                                    wordSpacing: 5,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.next();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(color.orange),
                        width: 3,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(color.orange),
                              Color(color.orange),
                            ]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.east,
                        color: Colors.white,
                        size: 30,
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
