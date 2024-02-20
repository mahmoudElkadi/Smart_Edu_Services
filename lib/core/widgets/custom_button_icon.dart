import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/reusable_text.dart';

import '../utils/app_style.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.onTap,
      required this.text,
      this.color,
      this.backGroundColor,
      this.width,
      this.height});
  final void Function()? onTap;
  final String text;
  final Color? color;
  final Color? backGroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height ?? 10.h, horizontal: width ?? 10.w),
        decoration: BoxDecoration(
            color: backGroundColor ?? Colors.orange,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.w,
              ),
              ReusableText(
                  text: text,
                  style: appStyle(
                      context, 18, color ?? Colors.white, FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
