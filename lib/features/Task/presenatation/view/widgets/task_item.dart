import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/task%20details.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../../core/widgets/width-spacer.dart';
import '../../../data/model/task_res_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.color, required this.task});
  final Color color;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Serial Number #",
                      style:
                          appStyle(context, 20, Colors.black, FontWeight.bold),
                    ),
                    Text(
                      task.serialNumber != null
                          ? task.serialNumber.toString()
                          : "-",
                      style:
                          appStyle(context, 20, Colors.black, FontWeight.bold),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.h)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeightSpacer(25),
                            Row(
                              children: [
                                const WidthSpacer(10),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    // padding: EdgeInsets.only(
                                    //     top: 10.h, left: 10.w, right: 5.w),
                                    padding: EdgeInsets.zero,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Title",
                                              style: appStyle(context, 18,
                                                  Colors.grey, FontWeight.w600),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              child: Text(
                                                task.title != null
                                                    ? task.title.toString()
                                                    : "-",
                                                maxLines: 1,
                                                style: appStyle(
                                                    context,
                                                    20,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const HeightSpacer(20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Client",
                                                    style: appStyle(
                                                        context,
                                                        18,
                                                        Colors.grey,
                                                        FontWeight.w600),
                                                  ),
                                                  Text(
                                                    task.client?.clientname !=
                                                            null
                                                        ? task.client?.clientname
                                                                .toString()
                                                            as String
                                                        : "-",
                                                    maxLines: 1,
                                                    style: appStyle(
                                                        context,
                                                        18,
                                                        Colors.black,
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const HeightSpacer(20),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Freelancer",
                                                    style: appStyle(
                                                        context,
                                                        18,
                                                        Colors.grey,
                                                        FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.45,
                                                    child: Text(
                                                      task.freelancer
                                                                  ?.freelancername !=
                                                              null
                                                          ? task.freelancer
                                                                  ?.freelancername
                                                                  .toString()
                                                              as String
                                                          : "-",
                                                      maxLines: 1,
                                                      style: appStyle(
                                                          context,
                                                          18,
                                                          Colors.black,
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const HeightSpacer(30),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Profit",
                                          style: appStyle(
                                              context,
                                              18,
                                              Colors.grey.shade600,
                                              FontWeight.w700),
                                        ),
                                        const HeightSpacer(7),
                                        Text(
                                          task.profitAmount != null
                                              ? task.profitAmount.toString()
                                              : "-",
                                          style: appStyle(context, 18,
                                              Colors.black, FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Deadline",
                                          style: appStyle(
                                              context,
                                              18,
                                              Colors.grey.shade600,
                                              FontWeight.w700),
                                        ),
                                        const HeightSpacer(7),
                                        Text(
                                          task.deadline != null
                                              ? DateFormat('dd/MM/yyyy HH:mm a')
                                                  .format(
                                                      task.deadline as DateTime)
                                              : "",
                                          maxLines: 1,
                                          style: appStyle(context, 17,
                                              Colors.black, FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const HeightSpacer(20),
                            Center(
                                child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 10.h),
                              decoration: BoxDecoration(
                                  color: color.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15.w)),
                              child: Center(
                                child: Text(
                                    task.taskStatus?.statusname.toString() ??
                                        "-",
                                    style: appStyle(context, 18, Colors.white,
                                        FontWeight.bold)),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: MediaQuery.sizeOf(context).width * 0.35,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => TaskDetials(id: task.id.toString()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/logo.png",
                              fit: BoxFit.cover,
                              width: 50.h,
                              height: 50.h,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
