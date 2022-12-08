import 'package:flutter/material.dart';
import 'package:project2022/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../constants/images.dart';

class ExperianceItems extends StatefulWidget {
  @override
  State<ExperianceItems> createState() => _ExperianceItemsState();
}

class _ExperianceItemsState extends State<ExperianceItems> {
  var consulting;

  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 3.h,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        color: Color(0xffEAEAEA),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xffEAEAEA),
          width: 1.5,
        ),
      ),
      child: Container(
        child: ListTile(
          leading: Image.asset(
            Images.password,
            height: 6.h,
          ),
          trailing: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: DropdownButton<String>(
              hint: Text(
                "choose your experiance",
                style: TextStyle(color: Color(color.blue)),
              ),
              underline: SizedBox(),
              value: consulting,
              onChanged: (e) {
                setState(() {
                  consulting = (e as String?)!;
                });
              },
              items: ['medical', 'Family']
                  .map((e) => DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
