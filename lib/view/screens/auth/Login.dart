import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';
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
              backgroundColor: Color(color.blue),
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Image.asset(
                    Images.logwall,
                    height: 100.h,
                    width: 100.w,
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
                                          padding: const EdgeInsets.all(7.0),
                                          child: Image.asset(
                                            Images.email,
                                            height: 1.h,
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
                                          padding: const EdgeInsets.all(0),
                                          child: Image.asset(
                                            Images.password,
                                            height: 1.h,
                                          ),
                                        ),
                                        label: 'Password',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5.h,
                                        left: 1.w,
                                        right: 5.w,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          if (!_formKey1.currentState!
                                              .validate()) {
                                          } else
                                            Get.offNamed(Routes.Home);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 8.h,
                                          width: 85.w,
                                          decoration: BoxDecoration(
                                            color: Color(color.orange),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Color(color.blue),
                                              fontSize: 20.sp,
                                              fontFamily: Fonts.b,
                                            ),
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
                                          padding: const EdgeInsets.all(7.0),
                                          child: Image.asset(
                                            Images.email,
                                            height: 1.h,
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
                                          padding: const EdgeInsets.all(0),
                                          child: Image.asset(
                                            Images.password,
                                            height: 1.h,
                                          ),
                                        ),
                                        label: 'Password',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5.h,
                                        left: 1.w,
                                        right: 5.w,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          if (!_formKey1.currentState!
                                              .validate()) {
                                          } else
                                            Get.offNamed(Routes.Home);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 8.h,
                                          width: 85.w,
                                          decoration: BoxDecoration(
                                            color: Color(color.blue),
                                            borderRadius:
                                            BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 20.sp,
                                              fontFamily: Fonts.g,
                                            ),
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
