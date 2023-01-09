import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';
import '../../../Logic/Api/Controllers/AuthController.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import 'package:project2022/constants/colors.dart';
import '../../../constants/routes.dart';
import '../../../constants/validators.dart';
import '../../widgets/Fields.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return sharedPref?.getString("role") == "Expert"
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xff0A2647),
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  // Image.asset(
                  //   Images.logwall,
                  //   height: 100.h,
                  //   width: 100.w,
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned(
                    bottom: -25.h,
                    left: -60.w,
                    child: Transform.scale(
                      scale: 3.5,
                      child: Lottie.asset(
                        Images.footer,
                        height: 35.h,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15.h,
                    right: -50.w,
                    child: Lottie.asset(
                      Images.footer,
                      height: 35.h,
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    left: 5.w,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Color(color.orange),
                        fontFamily: Fonts.e,
                        fontSize: 25.sp,
                      ),
                      child: AnimatedTextKit(
                        pause: Duration(seconds: 10),
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText('welcome \n Back'),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 36.h,
                    left: 5.w,
                    child: Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: Color(color.white),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.80),
                                blurRadius: 25,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 3.h,
                              left: 5.w,
                            ),
                            child: SingleChildScrollView(
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                key: _formKey1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(color.blue),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.a,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'Let\'s start the fun',
                                      style: TextStyle(
                                        color: Color(color.gray),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.a,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 4.h,
                                        left: 1.w,
                                        right: 5.w,
                                      ),
                                      child: CustomFields(
                                        isExperiance: false,
                                        validator: Validators.email,
                                        isAddress: false,
                                        controller: emailController,
                                        isTime: false,
                                        isPhone: false,
                                        isPass: false,
                                        icon: Padding(
                                          padding: EdgeInsets.all(7.0),
                                          child: CircleAvatar(
                                            backgroundColor:
                                            Color(color.orange),
                                            radius: 13.sp,
                                            child: Icon(
                                              Icons.email_outlined,
                                              size: 15.sp,
                                              color: Color(color.white),
                                            ),
                                          ),
                                        ),
                                        label: 'E-mail',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 3.h,
                                        left: 1.w,
                                        right: 5.w,
                                      ),
                                      child: CustomFields(
                                        isExperiance: false,
                                        validator: Validators.password,
                                        isAddress: false,
                                        controller: passwordController,
                                        isTime: false,
                                        isPhone: false,
                                        isPass: true,
                                        icon: Padding(
                                          padding: EdgeInsets.all(7),
                                          child: CircleAvatar(
                                            backgroundColor:
                                            Color(color.orange),
                                            radius: 13.sp,
                                            child: Icon(
                                              Icons.password,
                                              size: 15.sp,
                                              color: Color(color.white),
                                            ),
                                          ),
                                        ),
                                        label: 'Password',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 4.h,
                                        left: 3.w,
                                        right: 2.w,
                                      ),
                                      child:InkWell(
                                        onTap: () async {
                                          if (!_formKey1.currentState!
                                              .validate()) {

                                          } else {
                                            Get.dialog(WillPopScope(
                                                child: Center(
                                                  child: Lottie.asset(
                                                    Images.loading,
                                                    height: 10.h,
                                                  ),
                                                ),
                                                onWillPop: () async {
                                                  return true;
                                                }));
                                            var token =
                                            await AuthController.login(
                                                emailController.text,
                                                passwordController.text,
                                                'expert');

                                            Get.back();
                                            if (token != null)
                                              Get.offAllNamed(Routes.Home);
                                          }
                                        },
                                        child:  Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            top: 1.h,
                                            right: 5.w,
                                          ),
                                          height: 13.5.h,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Transform.scale(
                                                scale:3,
                                                child: Lottie.asset(
                                                    Images.button,
                                                    height: 100.h,
                                                    width: 100.w
                                                ),
                                              ),
                                              Positioned(
                                                top: 4.3.h,
                                                left: 30.w,
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21.sp,
                                                    fontFamily: Fonts.a,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\' have account ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  fontFamily: Fonts.a,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    Register(),
                                    transition: Transition.zoom,
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Color(color.blue),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.a,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Image.asset(
                    Images.logwall,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: -25.h,
                    left: -60.w,
                    child: CircleAvatar(
                      backgroundColor: Color(color.orange),
                      radius: 250.sp,
                    ),
                  ),
                  Positioned(
                    top: -20.h,
                    right: -40.w,
                    child: CircleAvatar(
                      backgroundColor: Color(color.orange),
                      radius: 100.sp,
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    left: 5.w,
                    child: Text(
                      'Welcome \n Back',
                      style: TextStyle(
                        color: Color(color.orange),
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.c,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    right: 1.w,
                    child: Lottie.asset(
                      Images.welcome2,
                      width: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 36.h,
                    left: 6.w,
                    child: Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 88.w,
                          decoration: BoxDecoration(
                            color: Color(color.white),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.80),
                                blurRadius: 25,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 3.h,
                              left: 5.w,
                            ),
                            child: SingleChildScrollView(
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                key: _formKey1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(color.blue),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.a,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      'Let\'s do some adventure',
                                      style: TextStyle(
                                        color: Color(color.gray),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Fonts.a,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 3.h,
                                        left: 1.w,
                                        right: 5.w,
                                      ),
                                      child: CustomFields(
                                        isExperiance: false,
                                        validator: Validators.email,
                                        isAddress: false,
                                        controller: emailController,
                                        isTime: false,
                                        isPhone: false,
                                        isPass: false,
                                        icon: Padding(
                                          padding: EdgeInsets.all(7),
                                          child:CircleAvatar(
                                            backgroundColor:
                                            Color(color.orange),
                                            radius: 13.sp,
                                            child: Icon(
                                              Icons.email_outlined,
                                              size: 15.sp,
                                              color: Color(color.white),
                                            ),
                                          ),
                                        ),
                                        label: 'E-mail',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 3.h,
                                        left: 1.w,
                                        right: 5.w,
                                      ),
                                      child: CustomFields(
                                        isExperiance: false,
                                        validator: Validators.password,
                                        isAddress: false,
                                        controller: passwordController,
                                        isTime: false,
                                        isPhone: false,
                                        isPass: true,
                                        icon: Padding(
                                          padding: EdgeInsets.all(7),
                                          child: CircleAvatar(
                                            backgroundColor:
                                            Color(color.orange),
                                            radius: 13.sp,
                                            child: Icon(
                                              Icons.password,
                                              size: 15.sp,
                                              color: Color(color.white),
                                            ),
                                          ),
                                        ),
                                        label: 'Password',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 4.h,
                                        left: 3.w,
                                        right: 2.w,
                                      ),
                                      child:InkWell(
                                        onTap: () async {
                                          if (!_formKey1.currentState!
                                              .validate()) {

                                          } else {
                                            Get.dialog(WillPopScope(
                                                child: Center(
                                                  child: Lottie.asset(
                                                    Images.loading,
                                                    height: 10.h,
                                                  ),
                                                ),
                                                onWillPop: () async {
                                                  return true;
                                                }));
                                            var token =
                                                await AuthController.login(
                                                    emailController.text,
                                                    passwordController.text,
                                                    'User');

                                            Get.back();
                                            if (token != null)
                                              Get.offAllNamed(Routes.Home);

                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            top: 1.h,
                                            right: 5.w,
                                          ),
                                          height: 13.5.h,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Transform.scale(
                                                scale:3,
                                                child: Lottie.asset(
                                                    Images.button,
                                                    height: 100.h,
                                                    width: 100.w
                                                ),
                                              ),
                                              Positioned(
                                                top: 4.3.h,
                                                left: 30.w,
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 21.sp,
                                                    fontFamily: Fonts.a,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\' have account ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  fontFamily: Fonts.a,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    Register(),
                                    transition: Transition.zoom,
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Color(color.blue),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.a,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
