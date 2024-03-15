import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../../core/widgets/width-spacer.dart';
import '../../../data/models/client_model.dart';
import 'client_detials_view.dart';

class ClientItem extends StatelessWidget {
  const ClientItem({super.key, required this.client, this.onTap});
  final Client client;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: Colors.blue,
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
                                              "Name",
                                              style: appStyle(context, 18,
                                                  Colors.grey, FontWeight.w600),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              child: Text(
                                                client.clientname != null
                                                    ? client.clientname
                                                        .toString()
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
                                                    "Country",
                                                    style: appStyle(
                                                        context,
                                                        18,
                                                        Colors.grey,
                                                        FontWeight.w600),
                                                  ),
                                                  Text(
                                                    client.country
                                                                ?.countryName !=
                                                            null
                                                        ? client.country
                                                                ?.countryName
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
                                          "Task Count",
                                          style: appStyle(
                                              context,
                                              18,
                                              Colors.grey.shade600,
                                              FontWeight.w700),
                                        ),
                                        const HeightSpacer(7),
                                        Text(
                                          client.tasksCount != null
                                              ? client.tasksCount.toString()
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
                                          "Completed Task",
                                          style: appStyle(
                                              context,
                                              18,
                                              Colors.grey.shade600,
                                              FontWeight.w700),
                                        ),
                                        const HeightSpacer(7),
                                        Text(
                                          client.completedCount != null
                                              ? client.completedCount.toString()
                                              : "-",
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
                                          "Total Cost",
                                          style: appStyle(
                                              context,
                                              18,
                                              Colors.grey.shade600,
                                              FontWeight.w700),
                                        ),
                                        const HeightSpacer(7),
                                        Text(
                                          client.totalGain != null
                                              ? client.totalGain.toString()
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
                                          "Total Profit",
                                          style: appStyle(
                                              context,
                                              18,
                                              Colors.grey.shade600,
                                              FontWeight.w700),
                                        ),
                                        const HeightSpacer(7),
                                        Text(
                                          client.totalProfit != null
                                              ? client.totalProfit.toString()
                                              : "-",
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
                            GestureDetector(
                              onTap: onTap,
                              child: Center(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.h, vertical: 10.h),
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade700,
                                      borderRadius:
                                          BorderRadius.circular(15.w)),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.delete_forever,
                                          color: Colors.white,
                                        ),
                                        const WidthSpacer(10),
                                        Text("Delete",
                                            style: appStyle(context, 18,
                                                Colors.white, FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const HeightSpacer(5),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: MediaQuery.sizeOf(context).width * 0.35,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ClientDetialsView(
                                id: client.id as String,
                              ));
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
