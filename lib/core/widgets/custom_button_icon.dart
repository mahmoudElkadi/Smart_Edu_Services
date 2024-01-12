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
      this.width});
  final void Function()? onTap;
  final String text;
  final Color? color;
  final Color? backGroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        width: width,
        height: MediaQuery.of(context).size.width < 600 ? 55.h : 35.h,
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
                width: 15.w,
              ),
              ReusableText(
                  text: text,
                  style: appStyle(16, color ?? Colors.white, FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
