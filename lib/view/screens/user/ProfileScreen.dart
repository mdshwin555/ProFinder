import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../../../constants/images.dart';
import 'package:project2022/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  String? path = sharedPref?.getString("path");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                height: 20.h,
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
            StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      top: 8.h,
                      left: 6.w,
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
                    Positioned(
                      top: 143.sp,
                      left: 100.sp,
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
          ],
        ),
      ),
    );
  }
}
