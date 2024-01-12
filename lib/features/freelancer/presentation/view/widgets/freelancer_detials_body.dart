import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart/features/Task/presenatation/view/widgets/sort_by.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constatnt.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import 'edit_freelancer.dart';
import 'freelancer_details_table.dart';

class FreelancerDetialsViewBody extends StatelessWidget {
  const FreelancerDetialsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back)),
                Column(
                  children: [
                    const HeightSpacer(10),
                    Text(
                      "Freelancer Details",
                      style:
                          appStyle(20, Colors.grey.shade700, FontWeight.bold),
                    ),
                    const HeightSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          height: 70.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
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
                                        borderRadius:
                                            BorderRadius.circular(10.h)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Tasks Count",
                                          style: appStyle(12, Colors.black,
                                              FontWeight.bold)),
                                      const HeightSpacer(10),
                                      Text(
                                        status[0][1],
                                        style: appStyle(18, Colors.black,
                                            FontWeight.normal),
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
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
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
                                        borderRadius:
                                            BorderRadius.circular(10.h)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Completed Count",
                                          style: appStyle(12, Colors.black,
                                              FontWeight.bold)),
                                      const HeightSpacer(10),
                                      Text(
                                        status[1][1],
                                        style: appStyle(18, Colors.black,
                                            FontWeight.normal),
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
                    const HeightSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          height: 70.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
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
                                        borderRadius:
                                            BorderRadius.circular(10.h)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Gain",
                                          style: appStyle(12, Colors.black,
                                              FontWeight.bold)),
                                      const HeightSpacer(10),
                                      Text(
                                        status[0][1],
                                        style: appStyle(18, Colors.black,
                                            FontWeight.normal),
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
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
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
                                        borderRadius:
                                            BorderRadius.circular(10.h)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Profit",
                                          style: appStyle(12, Colors.black,
                                              FontWeight.bold)),
                                      const HeightSpacer(10),
                                      Text(
                                        status[1][1],
                                        style: appStyle(18, Colors.black,
                                            FontWeight.normal),
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
                    const HeightSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          height: 70.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: SvgPicture.asset(
                                    "assets/images/visa.svg",
                                    height: 45.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Account Details",
                                          style: appStyle(12, Colors.black,
                                              FontWeight.bold)),
                                      const HeightSpacer(10),
                                      Text(
                                        "Click Here",
                                        style: appStyle(14, Colors.grey,
                                                FontWeight.normal)
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.grey),
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
                              border:
                                  Border.all(color: Colors.black54, width: 1)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: SvgPicture.asset(
                                    "assets/images/pc.svg",
                                    height: 30.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("on Going Tasks",
                                          style: appStyle(12, Colors.black,
                                              FontWeight.bold)),
                                      const HeightSpacer(10),
                                      Text(
                                        status[1][1],
                                        style: appStyle(18, Colors.black,
                                            FontWeight.normal),
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
                    const HeightSpacer(20),
                    const EditFreelancer(),
                    const HeightSpacer(20),
                  ],
                ),
                Container(color: Colors.white, child: SortByView()),
                const FreelancerDetailsTable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
