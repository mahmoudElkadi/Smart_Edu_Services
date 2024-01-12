import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Settings/presentation/view/widgets/setting_form.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.h),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Settings",
                style: appStyle(20, Colors.grey.shade600, FontWeight.bold),
              ),
              const HeightSpacer(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width > 600
                            ? 100.w
                            : 80.w,
                        backgroundImage:
                            const AssetImage("assets/images/book.png"),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.width > 600
                              ? 85.h
                              : 125.h,
                          left: MediaQuery.of(context).size.width > 600
                              ? 156.w
                              : 125.w,
                          child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: const Icon(
                                Icons.photo_filter,
                                color: Colors.white,
                              )))
                    ],
                  ),
                ],
              ),
              const HeightSpacer(30),
              Text(
                "Your Account",
                style: appStyle(18, Colors.grey.shade600, FontWeight.bold),
              ),
              const HeightSpacer(20),
              SettingForm()
            ],
          ),
        ),
      ),
    );
  }
}
