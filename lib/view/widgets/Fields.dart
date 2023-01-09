import 'package:flutter/material.dart';
import 'package:project2022/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../constants/fonts.dart';

class CustomFields extends StatefulWidget {
  final String label;
  final Widget? icon;
  final bool isPass;
  final bool isPhone;
  final bool isTime;
  final bool isAddress;
  final bool isExperiance;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  CustomFields({
    required this.label,
    this.icon,
    required this.isPass,
    required this.isPhone,
    required this.isTime,
    required this.controller,
    required this.isAddress,
    required this.validator,
    required this.isExperiance,
  });

  @override
  State<CustomFields> createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  IconData visibility = Icons.visibility_off_outlined;
  bool hide = true;
  TimeOfDay? date;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      onTap: () async {
        widget.isTime == true
            ? date = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              )
            : null;
      },
      obscureText: widget.isPass && hide == true ? true : false,
      keyboardType: widget.isTime == true
          ? TextInputType.datetime
          : widget.isPhone == true
              ? TextInputType.number
              : widget.isPass == true
                  ? TextInputType.visiblePassword
                  :TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffEAEAEA),
        label: Text(
          widget.label,
          style: TextStyle(
            color: Color(color.blue),
            fontFamily: Fonts.a,
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
        prefixIcon: widget.icon,
        suffixIcon: widget.isPass == true
            ? IconButton(
                icon: hide
                    ? Icon(
                        Icons.visibility_off,
                        color: Color(color.orange),
                        size: 20.sp,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color(color.blue2),
                        size: 20.sp,
                      ),
                onPressed: () {
                  setState(() {
                    hide = !hide;
                  });
                },
              )
            : null,
      ),
    );
  }
}
