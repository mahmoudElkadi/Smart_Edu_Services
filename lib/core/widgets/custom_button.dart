import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/reusable_text.dart';

import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.text,
      this.color,
      this.backGroundColor,
      this.width,
      this.widget});
  final void Function()? onTap;
  final String text;
  final Color? color;
  final Widget? widget;
  final Color? backGroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: width,
        height: MediaQuery.of(context).size.width > 600
            ? MediaQuery.of(context).size.height * 0.175
            : MediaQuery.of(context).size.height * 0.065,
        decoration: BoxDecoration(
            color: backGroundColor ?? Colors.orange,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: widget ??
              ReusableText(
                  text: text,
                  style: appStyle(
                      context, 16, color ?? Colors.white, FontWeight.w600)),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key,
      this.onTap,
      this.color,
      this.backGroundColor,
      this.width,
      this.widget});
  final void Function()? onTap;
  final Color? color;
  final Widget? widget;
  final Color? backGroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: width,
        height: MediaQuery.of(context).size.width > 600
            ? MediaQuery.of(context).size.height * 0.175
            : MediaQuery.of(context).size.height * 0.065,
        decoration: BoxDecoration(
            color: backGroundColor ?? Colors.orange,
            borderRadius: BorderRadius.circular(20)),
        child: Center(child: widget),
      ),
    );
  }
}
