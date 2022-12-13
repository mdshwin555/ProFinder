import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project2022/view/screens/auth/Login.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/fonts.dart';
import '../../../../constants/images.dart';
import '../../../../constants/routes.dart';
import 'package:project2022/constants/colors.dart';
import '../../../../constants/validators.dart';
import '../../../../main.dart';
import 'dart:io';
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

  TextEditingController creditnumController = TextEditingController();





  TextEditingController date = TextEditingController();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey6 = GlobalKey<FormState>();
  String? _path;
  DateTime?startTime;
  DateTime?endTime;
  int CurrentStep = 0;
  var creditNum;

  void updateText(val) {
    setState(() {
      creditNum = val;
    });
  }

  void validateAddress(val) {
    setState(() {
      creditNum = val;
      Validators.price(val);
    });
  }

  List experiance = [
    'medical',
    'career',
    'Mental',
    'familial',
    'business',
  ];

  List days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  int selected=0;
  PageController consoltingController = PageController(
    initialPage: 0,
  );

  //DateTime?date;

  @override
  Widget build(BuildContext context) {
    return sharedPref?.getString("role") == "Expert"
        ? Scaffold(
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
                    height: 77.h,
                    width: 88.w,
                    padding: EdgeInsets.only(top: 3.h),
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
                                CurrentStep =
                                    index,
                            }
                                : CurrentStep <= 5
                                ? {
                              if (!_formKey6
                                  .currentState!
                                  .validate())
                                {}
                              else
                                CurrentStep =
                                    index,
                            }
                                : CurrentStep =
                                index;
                          });
                        },
                        elevation: 0,
                        type: StepperType.horizontal,
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
                                              CurrentStep = CurrentStep + 1,
                                          }
                                        : CurrentStep == 3
                                            ? {
                                                if (!_formKey4.currentState!
                                                    .validate())
                                                  {}
                                                else
                                                  CurrentStep = CurrentStep + 1,
                                              }
                                            : CurrentStep == 4
                                                ? {
                                                    if (!_formKey5.currentState!
                                                        .validate())
                                                      {}
                                                    else
                                                      CurrentStep =
                                                          CurrentStep + 1,
                                                  }
                                                : CurrentStep == 5
                                                    ? {
                                                        if (!_formKey6
                                                            .currentState!
                                                            .validate())
                                                          {}
                                                        else
                                                          Get.offNamed(
                                                              Routes.Login),
                                                      }
                                                    : Get.offNamed(
                                                        Routes.Login);
                          });
                        },
                        onStepCancel: () {
                          setState(() {
                            CurrentStep > 0 && CurrentStep <= 3
                                ? CurrentStep = CurrentStep - 1
                                : Get.toNamed(Routes.Login);
                          });
                        },
                        controlsBuilder:
                            (BuildContext context, ControlsDetails details) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 2.h,
                                  left: 1.w,
                                  right: 5.w,
                                  //bottom: 10.h
                                ),
                                child: InkWell(
                                  onTap: details.onStepContinue,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 8.h,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                      color: Color(color.blue),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      CurrentStep < 5 ? 'Continue' : 'Register',
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 20.sp,
                                        fontFamily: Fonts.g,
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
                    left: 6.w,
                    top: 15.h,
                  ),
                  child: Container(
                    height: 80.h,
                    width: 88.w,
                    decoration: BoxDecoration(
                      color: Color(color.white),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 3.h,
                        left: 5.w,
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                  color: Color(color.blue),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                  left: 20.w,
                                  right: 25.w,
                                ),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        CircleAvatar(
                                          radius: 60.sp,
                                          backgroundColor: Color(color.orange),
                                          foregroundImage: _path == null
                                              ? null
                                              : FileImage(File(_path!)),
                                          child: Icon(
                                            Icons.person,
                                            size: 60.sp,
                                            color: Color(color.blue),
                                          ),
                                        ),
                                        Positioned(
                                          top: 87.sp,
                                          left: 77.sp,
                                          child: CircleAvatar(
                                            backgroundColor: Color(color.white),
                                            radius: 25,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Color(color.blue),
                                              child: IconButton(
                                                onPressed: () async {
                                                  var imagePicker =
                                                      ImagePicker();
                                                  var xfile = _path == null
                                                      ? await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery)
                                                      : _path = null;
                                                  if (xfile != null) {
                                                    setState(() {
                                                      _path = xfile.path;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _path = null;
                                                    });
                                                  }
                                                },
                                                icon: _path == null
                                                    ? Icon(Icons.add)
                                                    : Icon(Icons.delete),
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
                                  icon: Icon(Icons.drive_file_rename_outline),
                                  label: 'User',
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
                                  icon: Icon(Icons.email_outlined),
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
                                  icon: Icon(Icons.password),
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
                                    if (!_formKey2.currentState!.validate()) {
                                    } else
                                      Get.toNamed(Routes.Login);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 8.h,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                      color: Color(color.blue),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                  left: 1.w,
                                  right: 5.w,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'already have account',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
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
                                          color: Color(color.orange),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).viewInsets.bottom,
                // ),
              ],
            ),
          );
  }

  List<Step> getSteps() => [

        Step(
          state: CurrentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: CurrentStep >= 0,
          title: Text(
            "",
            style: TextStyle(
              fontFamily: Fonts.g,
              fontSize: 15.sp,
              color: Color(color.blue),
            ),
          ),
          content: Container(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.h,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Images.username,
                          height: 1.h,
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
                      top: 1.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have account',
                          style: TextStyle(color: Colors.black, fontSize: 15),
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
                              color: Color(color.orange),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
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
            "",
            style: TextStyle(
              fontFamily: Fonts.g,
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
                    height: 16.h,
                    padding: EdgeInsets.only(
                      left: 20.w,
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
                              top: 70.sp,
                              left: 70.sp,
                              child: CircleAvatar(
                                backgroundColor: Color(color.white),
                                radius: 23,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color(color.blue),
                                  child: IconButton(
                                    onPressed: () async {
                                      var imagePicker = ImagePicker();
                                      var xfile = _path == null
                                          ? await imagePicker.pickImage(
                                              source: ImageSource.gallery)
                                          : _path = null;
                                      if (xfile != null) {
                                        setState(() {
                                          _path = xfile.path;
                                          sharedPref?.setString("path", _path!);
                                        });
                                      } else {
                                        setState(() {
                                          _path = null;
                                          sharedPref?.setString("path", _path!);
                                        });
                                      }
                                    },
                                    icon: _path == null
                                        ? Icon(
                                            Icons.edit,
                                            size: 15.sp,
                                          )
                                        : Icon(
                                            Icons.delete,
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
                    child: CustomFields(
                      isExperiance: false,
                      validator: Validators.name,
                      isAddress: false,
                      controller: nameController,
                      isTime: false,
                      isPhone: false,
                      isPass: false,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Images.username,
                          height: 1.h,
                        ),
                      ),
                      label: 'name',
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
                        padding: EdgeInsets.all(7.0),
                        child: Image.asset(
                          Images.address,
                          height: 1.h,
                        ),
                      ),
                      label: 'Address',
                    ),
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
          state: CurrentStep > 0 && CurrentStep >= 2
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 2,
          title: Text(
            "",
            style: TextStyle(
              fontFamily: Fonts.g,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: 5.h,
                  //     left: 1.w,
                  //     right: 5.w,
                  //   ),
                  //   child: CustomFields(
                  //     isExperiance: false,
                  //     validator: Validators.time,
                  //     isAddress: false,
                  //     controller: date,
                  //     isTime: true,
                  //     isPhone: false,
                  //     isPass: false,
                  //     icon: Padding(
                  //       padding: const EdgeInsets.all(7.0),
                  //       child: Image.asset(
                  //         Images.time,
                  //         height: 1.h,
                  //       ),
                  //     ),
                  //     label: 'Time',
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: Container(
                      width: 100.w,
                      height: 7.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your consulting',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            SizedBox(
                              height: 3.h,
                              width: 25.w,
                              child: PageView.builder(
                                controller: consoltingController,
                                scrollDirection: Axis.vertical,
                                itemCount: experiance.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    experiance[index],
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
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
                        child: Image.asset(
                          Images.username,
                          height: 1.h,
                        ),
                      ),
                      label: 'price',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
          state: CurrentStep > 0 && CurrentStep > 2
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 3,
          title: Text(
            "",
            style: TextStyle(
              fontFamily: Fonts.g,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: TextFormField(
                      validator: Validators.experiance,
                      controller: experienceController,
                      minLines: 2,
                      maxLines: 5,
                      maxLength: 150,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEAEAEA),
                        hintText: 'write your experiences',
                        hintStyle: TextStyle(
                          color: Color(color.blue),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Images.username,
                          height: 1.h,
                        ),
                      ),
                      label: 'details',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
          state: CurrentStep > 0 && CurrentStep > 3
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 4,
          title: Text(
            "",
            style: TextStyle(
              fontFamily: Fonts.g,
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
                           selected=i;
                         });
                        },
                        controller: PageController(
                          viewportFraction: 0.4,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return Text(
                            days[index],
                            style: TextStyle(
                              fontSize:selected==index?15.sp:10.sp,
                              fontWeight: FontWeight.w400,
                            ),
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
                      controller: priceController,
                      isTime: false,
                      isPhone: true,
                      isPass: false,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Images.username,
                          height: 1.h,
                        ),
                      ),
                      label: 'price',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      left: 1.w,
                      right: 5.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomFields(
                            isExperiance: false,
                            validator: Validators.time,
                            isAddress: false,
                            controller: date,
                            isTime: true,
                            isPhone: false,
                            isPass: false,
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset(
                                Images.time,
                                height: 1.h,
                              ),
                            ),
                            label: 'Start time',
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Expanded(
                          child: CustomFields(
                            isExperiance: false,
                            validator: Validators.time,
                            isAddress: false,
                            controller: date,
                            isTime: true,
                            isPhone: false,
                            isPass: false,
                            icon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset(
                                Images.time,
                                height: 1.h,
                              ),
                            ),
                            label: 'End time',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
          state: CurrentStep > 0 && CurrentStep > 4
              ? StepState.complete
              : StepState.indexed,
          isActive: CurrentStep >= 5,
          title: Text(
            "",
            style: TextStyle(
              fontFamily: Fonts.g,
              fontSize: 15.sp,
              color: CurrentStep < 2 ? Color(color.gray) : Color(color.blue),
            ),
          ),
          content: Container(
            padding: EdgeInsets.only(
              top: 5.h,
            ),
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
                          top: 16.5.h,
                          left: 8.w,
                          child: Text(
                            '${nameController.text}',
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
                      obscureText: true,
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
                    ), // CustomFields(
                    //   isExperiance: false,
                    //   validator: Validators.price,
                    //   isAddress: false,
                    //   controller: priceController,
                    //   isTime: false,
                    //   isPhone: true,
                    //   isPass: false,
                    //   icon: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Image.asset(
                    //       Images.username,
                    //       height: 1.h,
                    //     ),
                    //   ),
                    //   label: 'price',
                    // ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ];
}
