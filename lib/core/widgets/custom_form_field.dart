import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as colorr;

import '../utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.obscureText,
      this.color,
      this.hintColor,
      this.onChanged,
      this.onEditingComplete,
      this.textColor,
      this.cursorColor,
      this.label,
      this.width,
      this.maxLines,
      this.prefixIcon});
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Color? color;
  final Color? hintColor;
  final Color? textColor;
  final Color? cursorColor;
  final Function(String str)? onChanged;
  final Function()? onEditingComplete;
  final double? width;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 15),
      width: width,
      child: TextFormField(
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        cursorColor: cursorColor ?? Colors.black,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: color ?? Colors.grey,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle:
              appStyle(context, 14, hintColor ?? Colors.grey, FontWeight.w500),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10.h)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorr.Colors.blueColor, width: 1),
              borderRadius: BorderRadius.circular(10.h)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10.h)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 1),
              borderRadius: BorderRadius.circular(10.h)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 1),
              borderRadius: BorderRadius.circular(10.h)),
          border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style:
            appStyle(context, 18, textColor ?? Colors.black, FontWeight.w500),
        validator: validator,
      ),
    );
  }
}
