import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../../../Logic/Api/Controllers/AuthController.dart';
import '../../../Logic/Api/Controllers/ExpertController.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import 'package:project2022/constants/colors.dart';
import '../../../constants/routes.dart';
import 'package:project2022/view/screens/auth/Type.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? path = sharedPref?.getString("path");
  bool val = sharedPref?.getString("theme") == "dark" ? true : false;
  var SelectedLang = sharedPref?.getString("lang") == "ar" ? "🇸🇦" : "🇱🇷";
  bool value = sharedPref?.getString("lang")=="ar"?false:true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -40.h,
              right: -18.w,
              child: CircleAvatar(
                backgroundImage: AssetImage(Images.two),
                radius: 200.sp,
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      top: 9.h,
                      left: 30.w,
                      child: CircleAvatar(
                        radius: 65.sp,
                        backgroundColor: Color(color.white),
                        child: CircleAvatar(
                          radius: 60.sp,
                          backgroundColor: Color(color.orange),
                          foregroundImage:
                              path == null ? null : FileImage(File(path!)),
                          child: Image.asset(
                            Images.expert,
                            height: 12.h,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24.h,
                      left: 60.w,
                      child: CircleAvatar(
                        backgroundColor: Color(color.white),
                        radius: 19.sp,
                        child: CircleAvatar(
                          radius: 15.sp,
                          backgroundColor: path == null
                              ? Color(color.blue)
                              : Color(color.orange),
                          child: IconButton(
                            onPressed: () async {
                              var imagePicker = ImagePicker();
                              var xfile = path == null
                                  ? await imagePicker.pickImage(
                                      source: ImageSource.gallery)
                                  : path = null;
                              if (xfile != null) {
                                setState(() {
                                  path = xfile.path;
                                  sharedPref?.setString("path", path!);
                                });
                              } else {
                                setState(() {
                                  path = null;
                                  sharedPref?.setString("path", path!);
                                });
                              }
                            },
                            icon: path == null
                                ? Icon(
                                    Icons.edit,
                                    size: 15.sp,
                                    color: Color(color.orange),
                                  )
                                : Icon(
                                    Icons.delete,
                                    size: 15.sp,
                                    color: Color(color.blue),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              top: 30.h,
              child: Container(
                width: 100.w,
                child: FutureBuilder<dynamic>(
                  future: AuthController.userProfile(token: '${sharedPref?.getString('access_token')}'),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        alignment: Alignment.center,
                        child: Text('${sharedPref?.getString("name")}', style: TextStyle(
                          letterSpacing: 0.8,
                          fontFamily: Fonts.d,
                          fontSize: 25.sp,
                          color: sharedPref?.getString("theme")=="dark"?Color(color.white):Color(color.blue),
                        ),),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      sharedPref?.setString("name", "${snapshot.data['user_name']}");
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        alignment: Alignment.center,
                        child: Text(
                          '${snapshot.data['user_name']}',
                          style: TextStyle(
                            letterSpacing: 0.8,
                            fontFamily: Fonts.d,
                            fontSize: 25.sp,
                            color:sharedPref?.getString("theme")=="dark"?Color(color.white):Color(color.blue),
                          ),
                        ),
                      );

                    }
                    else  {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        alignment: Alignment.center,
                        child: Text('${sharedPref?.getString("name")}', style: TextStyle(
                          letterSpacing: 0.8,
                          fontFamily: Fonts.d,
                          fontSize: 25.sp,
                          color: sharedPref?.getString("theme")=="dark"?Color(color.white):Color(color.blue),
                        ),),
                      );
                    }

                  },
                ),
              ),
            ),
            sharedPref?.getString("lang") == "ar"?Positioned(
              top: 36.h,
              left: 7.w,
              child: Container(
                width: 85.w,
                height: 9.h,
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 5.w,
                      child: CupertinoSwitch(
                          activeColor: Color(color.orange),
                          value: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                              value
                                  ? {
                                sharedPref?.setString("theme", "dark"),
                                Get.changeTheme(ThemeData.dark()),
                              }
                                  : {
                                sharedPref?.setString("theme", "light"),
                                Get.changeTheme(ThemeData.light()),
                              };
                            });
                          }),

                    ),
                    Positioned(
                      right: 20.w,
                      child: Text(
                        "light".tr,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.j,
                          fontSize: 15.sp,
                          color: Color(color.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      child: Image.asset(
                        Images.darkmood,
                        height: 33.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ):Positioned(
              top: 36.h,
              left: 7.w,
              child: Container(
                width: 85.w,
                height: 9.h,
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 5.w,
                      child: Image.asset(
                        Images.darkmood,
                        height: 33.sp,
                      ),
                    ),
                    Positioned(
                      left: 19.w,
                      child: Text(
                        "light".tr,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.b,
                          fontSize: 15.sp,
                          color: Color(color.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      child: CupertinoSwitch(
                          activeColor: Color(color.orange),
                          value: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                              value
                                  ? {
                                sharedPref?.setString("theme", "dark"),
                                Get.changeTheme(ThemeData.dark()),
                              }
                                  : {
                                sharedPref?.setString("theme", "light"),
                                Get.changeTheme(ThemeData.light()),
                              };
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            sharedPref?.getString("lang") == "ar"?Positioned(
              top: 48.h,
              left: 7.w,
              child: Container(
                width: 85.w,
                height: 9.h,
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 3.w,
                      child: Transform.scale(
                        scale: 0.8,
                        child: AnimatedToggleSwitch<bool>.dual(
                          loading: false,
                          current: value,
                          first: false,
                          second: true,
                          dif: 2.w,
                          borderColor: Colors.transparent,
                          borderWidth: 5.0,
                          height: 55,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1.5),
                            ),
                          ],
                          onChanged: (b) {
                            setState(() {
                              value = b;
                              b == false
                                  ? {
                                controller.changeLang("ar"),
                              }
                                  : {
                                controller.changeLang("en"),
                              };

                            });
                            return Future.delayed(Duration(seconds: 2));
                          },
                          colorBuilder: (b) => b ? Colors.orange : Colors.orange,
                          iconBuilder: (value) => value
                              ? CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.uk,
                            ),
                          )
                              :CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.sa,
                            ),
                          ),
                          textBuilder: (value) => value
                              ? CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.sa,
                            ),
                          )
                              : CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.uk,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 19.w,
                      child: Text(
                        'lang'.tr,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.j,
                          fontSize: 15.sp,
                          color: Color(color.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3.w,
                      child:  Image.asset(
                        Images.lang,
                        height: 33.sp,
                      ),

                    ),
                  ],
                ),
              ),
            ):Positioned(
              top: 48.h,
              left: 7.w,
              child: Container(
                width: 85.w,
                height: 9.h,
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 5.w,
                      child: Image.asset(
                        Images.lang,
                        height: 33.sp,
                      ),
                    ),
                    Positioned(
                      left: 19.w,
                      child: Text(
                        'lang'.tr,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.b,
                          fontSize: 15.sp,
                          color: Color(color.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3.w,
                      child: Transform.scale(
                        scale: 0.8,
                        child: AnimatedToggleSwitch<bool>.dual(
                          loading: false,
                          current: value,
                          first: false,
                          second: true,
                          dif: 2.w,
                          borderColor: Colors.transparent,
                          borderWidth: 5.0,
                          height: 55,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1.5),
                            ),
                          ],
                          onChanged: (b) {
                            setState(() {
                              value = b;
                              b == false
                                  ? {
                                controller.changeLang("ar"),
                              }
                                  : {
                                controller.changeLang("en"),
                              };

                            });
                            return Future.delayed(Duration(seconds: 2));
                          },
                          colorBuilder: (b) => b ? Colors.orange : Colors.orange,
                          iconBuilder: (value) => value
                              ? CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.uk,
                            ),
                          )
                              :CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.sa,
                            ),
                          ),
                          textBuilder: (value) => value
                              ? CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.sa,
                            ),
                          )
                              : CircleAvatar(
                            foregroundImage: AssetImage(
                              Images.uk,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sharedPref?.getString("lang") == "ar"?Positioned(
              top: 60.h,
              left: 7.w,
              child: Container(
                width: 85.w,
                height: 9.h,
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 5.w,
                      child: IconButton(
                        color: Color(color.yellow),
                        onPressed: () {
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

                                                Get.to(Type());
                                                //sharedPref?.clear();
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
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 19.w,
                      child: Text(
                        'logout'.tr,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.j,
                          fontSize: 15.sp,
                          color: Color(color.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      child:  Image.asset(
                        Images.logout,
                        height: 33.sp,
                      ),

                    ),
                  ],
                ),
              ),
            ):Positioned(
              top: 60.h,
              left: 7.w,
              child: Container(
                width: 85.w,
                height: 9.h,
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
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 5.w,
                      child: Image.asset(
                        Images.logout,
                        height: 33.sp,
                      ),
                    ),
                    Positioned(
                      left: 19.w,
                      child: Text(
                        'logout'.tr,
                        style: TextStyle(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.b,
                          fontSize: 15.sp,
                          color: Color(color.blue),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      child: IconButton(
                        color: Color(color.yellow),
                        onPressed: () {
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

                                                Get.to(Type());
                                                //sharedPref?. ();
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
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
