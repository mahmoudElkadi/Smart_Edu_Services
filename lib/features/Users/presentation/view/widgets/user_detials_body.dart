import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Users/presentation/view/widgets/task_user_table.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/heigher-spacer.dart';

class UserDetialsBody extends StatelessWidget {
  const UserDetialsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              const HeightSpacer(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: MediaQuery.of(context).size.width,
                height: 80.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.h),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/book.png",
                              fit: BoxFit.cover,
                              width: 32.h,
                              height: 32.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Mahmoud Elkady",
                          style: appStyle(14, Colors.black, FontWeight.w400),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10.h),
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        color: color.Colors.blueColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Text(
                        "Admin",
                        textAlign: TextAlign.center,
                        style: appStyle(
                            14, color.Colors.blueColor, FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 70.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 1)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Container(
                                width: 40,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: status[0][2].withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.h)),
                                child: Icon(
                                  status[0][3],
                                  color: status[0][2],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tasks Count",
                                      style: appStyle(
                                          11, Colors.black, FontWeight.bold)),
                                  const HeightSpacer(10),
                                  Text(
                                    status[0][1],
                                    style: appStyle(
                                        18, Colors.black, FontWeight.normal),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 70.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 1)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Container(
                                width: 40,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: status[5][2].withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.h)),
                                child: Icon(
                                  status[1][3],
                                  color: status[5][2],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Completed Count",
                                      style: appStyle(
                                          11, Colors.black, FontWeight.bold)),
                                  const HeightSpacer(10),
                                  Text(
                                    status[1][1],
                                    style: appStyle(
                                        18, Colors.black, FontWeight.normal),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 70.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 1)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Container(
                                width: 40,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: status[7][2].withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.h)),
                                child: Icon(
                                  status[7][3],
                                  color: status[7][2],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Gain",
                                      style: appStyle(
                                          11, Colors.black, FontWeight.bold)),
                                  const HeightSpacer(10),
                                  Text(
                                    status[0][1],
                                    style: appStyle(
                                        18, Colors.black, FontWeight.normal),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 70.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 1)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Container(
                                width: 40,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: status[10][2].withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.h)),
                                child: Icon(
                                  status[1][3],
                                  color: status[10][2],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Profit",
                                      style: appStyle(
                                          11, Colors.black, FontWeight.bold)),
                                  const HeightSpacer(10),
                                  Text(
                                    status[1][1],
                                    style: appStyle(
                                        18, Colors.black, FontWeight.normal),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(20),
              const UserTaskTable()
            ],
          ),
        ),
      ),
    );
  }
}
