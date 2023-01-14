import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/routes.dart';
import '../../../main.dart';
import '../../../view/screens/ListModel.dart';

abstract class OnboardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late PageController pageController;
  late PageController lottieController;

  int currentPage = 0;

  @override
  next() {
    currentPage++;
    currentPage > onBoardingList.length - 1
        ? {
            Get.offNamed(Routes.typeScreen),
            sharedPref?.setString("onboarding", "true"),
          }
        : pageController.animateToPage(
            currentPage,
            duration: const Duration(
              milliseconds: 900,
            ),
            curve: Curves.easeInOut,
          );

    lottieController.animateToPage(
      currentPage,
      duration: const Duration(
        milliseconds: 900,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    lottieController = PageController();
    super.onInit();
  }
}
