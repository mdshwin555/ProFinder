import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/view/screens/auth/Login.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/fonts.dart';
import '../../../../constants/images.dart';
import '../../../../constants/routes.dart';
import 'package:project2022/constants/colors.dart';
import '../../../../constants/validators.dart';
import '../../../../main.dart';
import 'dart:io';
import '../../../Logic/Api/Controllers/AuthController.dart';
import '../../widgets/Fields.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController consultingController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController experienceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  TextEditingController periodController = TextEditingController();
  TimeOfDay startTime =
      TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
  TimeOfDay endTime =
      TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);

  TextEditingController creditnumController = TextEditingController();

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey6 = GlobalKey<FormState>();

  String? _path;
  int CurrentStep = 0;
  var creditNum;
  var token2;
  var addexperiance;
  var addtimes;
  var loginexpertperiance;
  var loginexpert;
  var timesloginexpert;

  void updateText(val) {
    setState(() {
      creditNum = val;
    });
  }

  void nextaddexperiance() async {
    loginexpert = await AuthController.login(
        emailController.text, passwordController.text, 'expert');

    addexperiance = await AuthController.addExperience(
      token: '$loginexpert',
      experiences: current==0?experiance2[current1]:current==1?experiance3[current1]:current==2?experiance4[current1]:current==3?experiance5[current1]:experiance6[current1],
      details: detailsController.text,
    );
    if (addexperiance == 200) {
    } else
      print('${loginexpert.toString()},'
          '${experienceController.text},'
          '${detailsController.text},');
  }

  void userRegister() async {
    if (!_formKey2.currentState!.validate()) {
    } else {
      var token = await AuthController.register(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: '${sharedPref?.getString("role")}',
      );
      Get.dialog(
        Container(
          padding: EdgeInsets.only(
            bottom: 16.h,
            left: 5.w,
            right: 5.w,
          ),
          height: 50.h,
          width: 90.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 38.h,
                child: Container(
                  height: 35.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 11.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Register complete Successfully \n,Please login now !! ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Color(color.blue),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'ok',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 20.sp,
                                fontFamily: Fonts.a,
                                decoration: TextDecoration.none,
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
                backgroundColor: Colors.green,
                child: Text(
                  '🥳',
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
      if (token == true) {
        Get.dialog(
          Container(
            padding: EdgeInsets.only(
              bottom: 16.h,
              left: 5.w,
              right: 5.w,
            ),
            height: 50.h,
            width: 90.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 38.h,
                  child: Container(
                    height: 35.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 11.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Register complete Successfully \n,Please login now !! ',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color(color.blue),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
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
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'ok',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 20.sp,
                                  fontFamily: Fonts.a,
                                  decoration: TextDecoration.none,
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
                  backgroundColor: Colors.green,
                  child: Text(
                    '🥳',
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
        Get.offAllNamed(Routes.Login);
        sharedPref?.setString("name", userNameController.text);
      } else
        Get.dialog(
          Container(
            padding: EdgeInsets.only(
              bottom: 16.h,
              left: 5.w,
              right: 5.w,
            ),
            height: 50.h,
            width: 90.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 38.h,
                  child: Container(
                    height: 35.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 11.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Please check your information \n,and login again !! ',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color(color.blue),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
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
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'ok',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 20.sp,
                                  fontFamily: Fonts.a,
                                  decoration: TextDecoration.none,
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
                  backgroundColor: Colors.red,
                  child: Text(
                    '😔',
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(color.white)),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  void creditaddexperiance() async {
    loginexpert = await AuthController.login(
        emailController.text, passwordController.text, 'expert');

    addexperiance = await AuthController.addCredit(
        token: '$loginexpert', balance: '${creditnumController.text}');
    if (addexperiance == 200) {
      Get.dialog(
        Container(
          padding: EdgeInsets.only(
            bottom: 16.h,
            left: 5.w,
            right: 5.w,
          ),
          height: 50.h,
          width: 90.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 38.h,
                child: Container(
                  height: 35.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 11.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Register complete Successfully \n,Please login now !! ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Color(color.blue),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'ok',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 20.sp,
                                fontFamily: Fonts.a,
                                decoration: TextDecoration.none,
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
                backgroundColor: Colors.green,
                child: Text(
                  '🥳',
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
    } else
      print('${loginexpert.toString()},'
          '${creditnumController.text},');
  }

  void usercreditaddexperiance() async {
    loginexpert = await AuthController.login(
        emailController.text, passwordController.text, 'User');

    addexperiance = await AuthController.addCredit(
        token: '$loginexpert', balance: '${creditnumController.text}');
    if (addexperiance == 200) {
      Get.dialog(
        Container(
          padding: EdgeInsets.only(
            bottom: 16.h,
            left: 5.w,
            right: 5.w,
          ),
          height: 50.h,
          width: 90.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 38.h,
                child: Container(
                  height: 35.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 11.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Register complete Successfully \n,Please login now !! ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Color(color.blue),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
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
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'ok',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 20.sp,
                                fontFamily: Fonts.a,
                                decoration: TextDecoration.none,
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
                backgroundColor: Colors.green,
                child: Text(
                  '🥳',
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
    } else
      print('${loginexpert.toString()},'
          '${creditnumController.text},');
  }

  void timesaddexperiance() async {
    addtimes = await AuthController.addtime(
      token: '$loginexpert',
      day: '${month[selected]}',
      from: '${startTime.hour}',
      to: '${endTime.hour}',
      period: '${periodController.text}',
      month: '${month[selected]}',
    );
    if (addtimes == 200) {
    } else
      print('${loginexpert.toString()},'
          '${month[selected]},'
          '${startTime.hour},'
          '${endTime.hour},'
          '${periodController.text},'
          '${DateTime.now().month},');
  }

  void validateAddress(val) {
    setState(() {
      creditNum = val;
      Validators.price(val);
    });
  }

  List experiance = [
    'Medical',
    'Professional',
    'Mental',
    'Familial',
    'Business',
  ];

  List experiance2 = [
    'Sergery',
    'Baby',
    'Women',
    'Eyes',
    'Nose',
  ];

  List experiance3 = [
    'Worker',
    'Cooker',
    'Teacher',
    'Driver',
    'Attorney'
  ];

  List experiance4 = [
    'addiction',
    'physical',
    'teens',
    'legit',
    'palliative'
  ];
  List experiance5 = [
    'health',
    'Tumors',
    'chronic',
    'protection',
    'survey'
  ];

  List experiance6 = [
    'marketer',
    'Relations',
    'financing',
    'Hype',
    'trade'
  ];

  List days = [
    'Mon',
    'Tue',
    'Wed',
    'Thur',
    'Fri',
    'Sat',
    'Sun',
  ];

  List month = [
    '${DateTime.now().day}',
    '${DateTime.now().day + 1}',
    '${DateTime.now().day + 2}',
    '${DateTime.now().day + 3}',
    '${DateTime.now().day + 4}',
    '${DateTime.now().day + 5}',
    '${DateTime.now().day + 6}',
  ];
  int selected = 0;
  int current = 0;
  int current1 = 0;

  final consoltingController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return sharedPref?.getString("role") == "Expert"
        ?Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            Images.logwall,
            height: 100.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              left: 5.w,
            ),
            child: Text(
              'Create account ',
              style: TextStyle(
                color: Color(color.orange),
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.h,
              ),
            ),
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
          Padding(
            padding: EdgeInsets.only(
              left: 6.w,
              top: 17.5.h,
            ),
            child: Container(
              height: 75.h,
              width: 88.w,
              // padding: EdgeInsets.only(top: 1.h),
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
              child: Theme(
                data: Theme.of(context).copyWith(
                    colorScheme:
                    ColorScheme.light(primary: Color(color.orange))),
                child: Stepper(
                  onStepTapped: (index) {
                    setState(() {
                      CurrentStep <= 0
                          ? {
                        if (!_formKey1.currentState!.validate())
                          {}
                        else
                          CurrentStep = index,
                      }
                          : CurrentStep <= 1
                          ? {
                        if (!_formKey2.currentState!.validate())
                          {}
                        else
                          CurrentStep = index,
                      }
                          : CurrentStep <= 2
                          ? {
                        if (!_formKey3.currentState!
                            .validate())
                          {}
                        else
                          CurrentStep = index,
                      }
                          : CurrentStep <= 3
                          ? {
                        if (!_formKey4.currentState!
                            .validate())
                          {}
                        else
                          CurrentStep = index,
                      }
                          : CurrentStep <= 4
                          ? {
                        if (!_formKey5.currentState!
                            .validate())
                          {}
                        else
                          CurrentStep = index,
                      }
                          : CurrentStep <= 5
                          ? {
                        if (!_formKey6
                            .currentState!
                            .validate())
                          {}
                        else
                          CurrentStep = index,
                      }
                          : CurrentStep = index;
                    });
                  },
                  elevation: 0,
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: CurrentStep,
                  onStepContinue: () {
                    setState(() {
                      CurrentStep == 0
                          ? {
                        if (!_formKey1.currentState!.validate())
                          {}
                        else
                          CurrentStep = CurrentStep + 1,
                      }
                          : CurrentStep == 1
                          ? {
                        if (!_formKey2.currentState!.validate())
                          {}
                        else
                          CurrentStep = CurrentStep + 1,
                      }
                          : CurrentStep == 2
                          ? {
                        if (!_formKey3.currentState!
                            .validate())
                          {}
                        else
                          {
                            CurrentStep = CurrentStep + 1,
                            token2 =
                                AuthController.addExpert(
                                  username:
                                  userNameController.text,
                                  email: emailController.text,
                                  password:
                                  passwordController.text,
                                  image: _path,
                                  name: userNameController.text,
                                  phone: phoneController.text,
                                  address:
                                  addressController.text,
                                  price: priceController.text,
                                  consulting:
                                  experiance[current],
                                  role: 'expert',
                                ),
                            if (token2 == 200)
                              {
                                CurrentStep =
                                    CurrentStep + 1,
                                Get.snackbar(
                                    'register Succsess',
                                    'ok'),
                              }
                            else
                              print(
                                  '${userNameController.text},'
                                      '${emailController.text},'
                                      '${passwordController.text}'
                                      '${_path}'
                                      '${nameController.text}'
                                      '${phoneController.text}'
                                      '${addressController.text}'
                                      '${priceController.text}'
                                      '${experiance[current]}'),
                          }
                      }
                          : CurrentStep == 3
                          ? {
                        if (!_formKey4.currentState!
                            .validate())
                          {}
                        else
                          {
                            nextaddexperiance(),
                            CurrentStep =
                                CurrentStep + 1,
                          }
                      }
                          : CurrentStep == 4
                          ? {
                        if (!_formKey5.currentState!
                            .validate())
                          {}
                        else
                          {
                            timesaddexperiance(),
                            CurrentStep =
                                CurrentStep + 1,
                          }
                      }
                          : CurrentStep == 5
                          ? {
                        if (!_formKey6
                            .currentState!
                            .validate())
                          {}
                        else
                          {
                            creditaddexperiance(),
                            sharedPref?.setString(
                                "name",
                                userNameController
                                    .text),
                            Get.toNamed(
                                Routes.Login),
                          }
                      }
                          : {};
                    });
                  },
                  controlsBuilder: (context, details) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: 1.h,
                        right: 9.w,
                      ),
                      height: 12.h,
                      child: InkWell(
                        onTap: details.onStepContinue,
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
                              top: 3.5.h,
                              left: 25.w,
                              child: Text(
                                CurrentStep < 5 ? 'Continue' : 'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  fontFamily: Fonts.a,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.w,
              top: 93.5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have account ?',
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
                      Login(),
                      transition: Transition.zoom,
                    );
                  },
                  child: Text(
                    'Login',
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
    )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Image.asset(
                  Images.logwall,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                    left: 5.w,
                  ),
                  child: Text(
                    'Create account ',
                    style: TextStyle(
                      color: Color(color.orange),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.h,
                    ),
                  ),
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.w,
                    top: 17.5.h,
                  ),
                  child: Container(
                    height: 75.h,
                    width: 88.w,
                    // padding: EdgeInsets.only(top: 1.h),
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
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme:
                              ColorScheme.light(primary: Color(color.orange))),
                      child: Stepper(
                        onStepTapped: (index) {
                          setState(() {
                            CurrentStep <= 0
                                ? {
                                    if (!_formKey1.currentState!.validate())
                                      {}
                                    else
                                      CurrentStep = index,
                                  }
                                : CurrentStep <= 1
                                    ? {
                                        if (!_formKey2.currentState!.validate())
                                          {}
                                        else
                                          CurrentStep = index,
                                      }
                                    : CurrentStep = index;
                          });
                        },
                        elevation: 0,
                        type: StepperType.vertical,
                        steps: getUserSteps(),
                        currentStep: CurrentStep,
                        onStepContinue: () {
                          setState(() {
                            CurrentStep == 0
                                ? {
                                    if (!_formKey1.currentState!.validate())
                                      {}
                                    else
                                      CurrentStep = CurrentStep + 1,
                                  }
                                : CurrentStep == 1
                                    ? {
                                        if (!_formKey2.currentState!.validate())
                                          {}
                                        else
                                          userRegister(),
                                        usercreditaddexperiance(),
                                        Get.toNamed(Routes.Login),
                                      }
                                    :
                                    // userRegister();
                                    Get.toNamed(Routes.Login);
                          });
                        },
                        controlsBuilder: (context, details) {
                          return Container(
                            padding: EdgeInsets.only(
                              top: 1.h,
                              right: 9.w,
                            ),
                            height: 12.h,
                            child: InkWell(
                              onTap: details.onStepContinue,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Transform.scale(
                                    scale: 3,
                                    child: Lottie.asset(Images.button,
                                        height: 100.h, width: 100.w),
                                  ),
                                  Positioned(
                                    top: 3.5.h,
                                    left: 25.w,
                                    child: Text(
                                      CurrentStep < 1 ? 'Continue' : 'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        fontFamily: Fonts.a,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.w,
                    top: 93.5.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have account ?',
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
                            Login(),
                            transition: Transition.zoom,
                          );
                        },
                        child: Text(
                          'Login',
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
          );
  }

  List<Step> getSteps() => [
        Step(
          state: CurrentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: CurrentStep >= 0,
          title: Text(
            " personal Information",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: CustomFields(
                      isExperiance: false,
                      validator: Validators.username,
                      isAddress: false,
                      controller: userNameController,
                      isTime: false,
                      isPhone: false,
                      isPass: false,
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.person,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'user name',
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
                        padding: EdgeInsets.all(7.0),
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
                        padding: EdgeInsets.all(8),
                        child:CircleAvatar(
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
                ],
              ),
            ),
          ),
        ),
        Step(
          state: CurrentStep > 0 && CurrentStep > 0
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 1,
          title: Text(
            "address",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: CurrentStep < 1 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey2,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 100.w,
                    height: 13.h,
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 20.w,
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50.sp,
                              backgroundColor: Color(color.orange),
                              foregroundImage: _path == null
                                  ? null
                                  : FileImage(File(_path!)),
                              child: Image.asset(
                                Images.expert,
                                height: 12.h,
                              ),
                            ),
                            Positioned(
                              top: 54.sp,
                              left: 69.sp,
                              child: CircleAvatar(
                                backgroundColor: Color(color.white),
                                radius: 22,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color(color.blue),
                                  child: IconButton(
                                    onPressed: () async {
                                      var imagePicker = ImagePicker();
                                      var xfile = await imagePicker.pickImage(
                                          source: ImageSource.gallery);
                                      if (xfile != null) {
                                        setState(() {
                                          _path = xfile.path;
                                          sharedPref?.setString("path", _path!);
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: InternationalPhoneNumberInput(
                      //initialValue: PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber),
                      selectorConfig: SelectorConfig(
                        leadingPadding: 4.w,
                        selectorType: PhoneInputSelectorType.DIALOG,
                        showFlags: true,
                        useEmoji: false,
                        trailingSpace: false,
                        setSelectorButtonAsPrefixIcon: true,
                      ),
                      textFieldController: phoneController,
                      formatInput: true,
                      spaceBetweenSelectorAndTextField: 0,
                      onInputChanged: (PhoneNumber value) {},
                      searchBoxDecoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: Color(0xffEAEAEA),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xffEAEAEA),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.orange,
                            ),
                          ),
                        ),
                      ),
                      inputDecoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(fontFamily: Fonts.a),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xffEAEAEA),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.orange,
                            ),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.red,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xffEAEAEA),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: CustomFields(
                      isExperiance: false,
                      validator: Validators.address,
                      isAddress: true,
                      controller: addressController,
                      isTime: false,
                      isPhone: false,
                      isPass: false,
                      icon: Padding(
                        padding: EdgeInsets.all(8),
                        child:CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.home_outlined,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'Address',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: CurrentStep > 0 && CurrentStep >= 2
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 2,
          title: Text(
            "Consultings",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            padding: EdgeInsets.only(
              top: 1.h,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                      left: 0.w,
                      right: 5.w,
                    ),
                    child: Container(
                      width: 100.w,
                      height: 7.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              Color(color.orange),
                              radius: 13.sp,
                              child: Icon(
                                Icons.category_outlined,
                                size: 15.sp,
                                color: Color(color.white),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'consulting',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: Fonts.a
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.5.h),
                              height: 3.h,
                              width: 24.w,
                              child: PageView.builder(
                                onPageChanged: (index) {
                                  print(index);
                                  setState(() {
                                    current = index;
                                  });
                                },
                                controller: consoltingController,
                                scrollDirection: Axis.vertical,
                                itemCount: experiance.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    experiance[index],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                        fontFamily: Fonts.a
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: CustomFields(
                      isExperiance: false,
                      validator: Validators.price,
                      isAddress: false,
                      controller: priceController,
                      isTime: false,
                      isPhone: true,
                      isPass: false,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.attach_money_sharp,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'price',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: CurrentStep > 0 && CurrentStep > 2
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 3,
          title: Text(
            "Experiences",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            padding: EdgeInsets.only(
              top: 1.h,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                      left: 0.w,
                      right: 5.w,
                    ),
                    child: Container(
                      width: 100.w,
                      height: 7.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              Color(color.orange),
                              radius: 13.sp,
                              child: Icon(
                                Icons.category_outlined,
                                size: 15.sp,
                                color: Color(color.white),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Experience',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: Fonts.a
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.5.h),
                              height: 3.h,
                              width: 24.w,
                              child: PageView.builder(
                                onPageChanged: (index) {
                                  print(index);
                                  setState(() {
                                    current1 = index;
                                  });
                                },
                                controller: consoltingController,
                                scrollDirection: Axis.vertical,
                                itemCount: experiance.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    current==0?experiance2[index]:current==1?experiance3[index]:current==2?experiance4[index]:current==3?experiance5[index]:experiance6[index],
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: Fonts.a
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: CustomFields(
                      isExperiance: false,
                      validator: Validators.details,
                      isAddress: false,
                      controller: detailsController,
                      isTime: false,
                      isPhone: false,
                      isPass: false,
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.info_outlined,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'details',
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        Step(
          state: CurrentStep > 0 && CurrentStep > 3
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 4,
          title: Text(
            "Times",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1.w,
                      right: 3.w,
                    ),
                    child: Container(
                      height: 10.h,
                      width: 75.w,
                      padding: EdgeInsets.only(
                        top: 3.h,
                        left: 5.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        color: Color(color.orange),
                      ),
                      child: PageView.builder(
                        onPageChanged: (i) {
                          print(days[i]);
                          setState(() {
                            selected = i;
                          });
                        },
                        controller: PageController(
                          viewportFraction: 0.4,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                days[index],
                                style: TextStyle(
                                  fontSize: selected == index ? 15.sp : 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                month[index],
                                style: TextStyle(
                                  fontSize: selected == index ? 15.sp : 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: CustomFields(
                      isExperiance: false,
                      validator: Validators.price,
                      isAddress: false,
                      controller: periodController,
                      isTime: false,
                      isPhone: true,
                      isPass: false,
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.timelapse_outlined,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'period',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorWidth: 0,
                            keyboardType: TextInputType.none,
                            // validator: Validators.time,
                            //controller: creditnumController,
                            onTap: () async {
                              TimeOfDay? newtime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (newtime == null) return;
                              if (newtime != null)
                                setState(() {
                                  startTime = newtime;
                                });
                            },
                            decoration: InputDecoration(
                              hintText:
                                  '${startTime.hour.toString()}:${startTime.minute.toString()}',
                              filled: true,
                              fillColor: Color(0xffEAEAEA),
                              label: Text(
                                'Start',
                                style: TextStyle(
                                  color: Color(color.blue),
                                  fontFamily: Fonts.a,
                                  fontSize: 10.sp
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Color(0xffEAEAEA),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: Color(
                                    color.orange,
                                  ),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: Color(
                                    color.red,
                                  ),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: Color(
                                    color.red,
                                  ),
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: CircleAvatar(
                                  backgroundColor:
                                  Color(color.orange),
                                  radius: 13.sp,
                                  child: Icon(
                                    Icons.access_time_sharp,
                                    size: 15.sp,
                                    color: Color(color.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorWidth: 0,
                            keyboardType: TextInputType.none,
                            // validator: Validators.time,
                            //controller: creditnumController,
                            onTap: () async {
                              TimeOfDay? newwtime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (newwtime == null) return;
                              if (newwtime != null)
                                setState(() {
                                  endTime = newwtime;
                                });
                            },
                            decoration: InputDecoration(
                              hintText:
                                  '${endTime.hour.toString()}:${endTime.minute.toString()}',
                              filled: true,
                              fillColor: Color(0xffEAEAEA),
                              label: Text(
                                'End',
                                style: TextStyle(
                                  color: Color(color.blue),
                                    fontFamily: Fonts.a,
                                    fontSize: 10.sp
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Color(0xffEAEAEA),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: Color(
                                    color.orange,
                                  ),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: Color(
                                    color.red,
                                  ),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.8,
                                  color: Color(
                                    color.red,
                                  ),
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: CircleAvatar(
                                  backgroundColor:
                                  Color(color.orange),
                                  radius: 10.sp,
                                  child: Icon(
                                    Icons.access_time_sharp,
                                    size: 15.sp,
                                    color: Color(color.white),
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
            ),
          ),
        ),
        Step(
          state: CurrentStep > 0 && CurrentStep > 4
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 5,
          title: Text(
            "credit card",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 1.w,
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          Images.credit,
                          width: 100.w,
                        ),
                        Positioned(
                          top: 10.5.h,
                          left: 22.w,
                          child: Text(
                            '${creditNum == null ? "0000" : creditNum}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.yellow,
                              fontFamily: Fonts.a,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 14.5.h,
                          left: 8.w,
                          child: Text(
                            '${userNameController.text}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.yellow,
                              fontFamily: Fonts.a,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                      left: 3.w,
                      right: 4.w,
                    ),
                    child: TextFormField(
                      onChanged: (val) {
                        updateText(val);
                      },
                      validator: Validators.price,
                      controller: creditnumController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEAEAEA),
                        label: Text(
                          'Credit Price',
                          style: TextStyle(
                            color: Color(color.blue),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xffEAEAEA),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.orange,
                            ),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.red,
                            ),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.red,
                            ),
                          ),
                        ),
                        prefixIcon: Image.asset(
                          Images.password,
                          height: 1.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ];
  List<Step> getUserSteps() => [
        Step(
          state: CurrentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: CurrentStep >= 0,
          title: Text(
            " personal Information",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 100.w,
                    height: 13.h,
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 20.w,
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50.sp,
                              backgroundColor: Color(color.orange),
                              foregroundImage: _path == null
                                  ? null
                                  : FileImage(File(_path!)),
                              child: Image.asset(
                                Images.expert,
                                height: 12.h,
                              ),
                            ),
                            Positioned(
                              top: 54.sp,
                              left: 69.sp,
                              child: CircleAvatar(
                                backgroundColor: Color(color.white),
                                radius: 22,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color(color.blue),
                                  child: IconButton(
                                    onPressed: () async {
                                      var imagePicker = ImagePicker();
                                      var xfile = await imagePicker.pickImage(
                                          source: ImageSource.gallery);
                                      if (xfile != null) {
                                        setState(() {
                                          _path = xfile.path;
                                          sharedPref?.setString("path", _path!);
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
                      validator: Validators.name,
                      isAddress: false,
                      controller: userNameController,
                      isTime: false,
                      isPhone: false,
                      isPass: false,
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.person_outline,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'Name',
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
                        padding: EdgeInsets.all(8.0),
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
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor:
                          Color(color.orange),
                          radius: 13.sp,
                          child: Icon(
                            Icons.lock_open,
                            size: 15.sp,
                            color: Color(color.white),
                          ),
                        ),
                      ),
                      label: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: CurrentStep > 0 && CurrentStep > 0
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 1,
          title: Text(
            "credit card",
            style: TextStyle(
              fontFamily: Fonts.a,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 1.w,
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          Images.credit,
                          width: 100.w,
                        ),
                        Positioned(
                          top: 11.5.h,
                          left: 18.w,
                          child: Text(
                            '${creditNum == null ? "0000" : creditNum}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.yellow,
                              fontFamily: Fonts.a,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15.h,
                          left: 8.w,
                          child: Text(
                            '${userNameController.text}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.yellow,
                              fontFamily: Fonts.a,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4.h,
                      left: 3.w,
                      right: 4.w,
                    ),
                    child: TextFormField(
                      onChanged: (val) {
                        updateText(val);
                      },
                      validator: Validators.price,
                      controller: creditnumController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEAEAEA),
                        label: Text(
                          'Credit Price',
                          style: TextStyle(
                            color: Color(color.blue),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            color: Color(0xffEAEAEA),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.orange,
                            ),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.red,
                            ),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 1.8,
                            color: Color(
                              color.red,
                            ),
                          ),
                        ),
                        prefixIcon: Image.asset(
                          Images.password,
                          height: 1.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ];
}
