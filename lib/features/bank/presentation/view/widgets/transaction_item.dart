import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../../core/widgets/width-spacer.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: HexColor("#3b82f6"),
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
                    const WidthSpacer(10),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeightSpacer(15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "From",
                                        style: appStyle(context, 18,
                                            Colors.grey, FontWeight.w600),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: Text(
                                          "Mahmoud Elkady",
                                          maxLines: 1,
                                          style: appStyle(context, 20,
                                              Colors.black, FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: appStyle(
                                            context,
                                            18,
                                            Colors.grey.shade600,
                                            FontWeight.w700),
                                      ),
                                      const HeightSpacer(7),
                                      Text(
                                        "12 EGP",
                                        maxLines: 1,
                                        style: appStyle(context, 17,
                                            Colors.black, FontWeight.w700),
                                      )
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
                const HeightSpacer(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: appStyle(
                                  context, 18, Colors.grey, FontWeight.w600),
                            ),
                            Text(
                              "ElHamzawy",
                              maxLines: 1,
                              style: appStyle(
                                  context, 18, Colors.black, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Exchange Rate",
                              style: appStyle(context, 18, Colors.grey.shade600,
                                  FontWeight.w700),
                            ),
                            const HeightSpacer(7),
                            Text(
                              "28",
                              style: appStyle(
                                  context, 18, Colors.black, FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                HeightSpacer(10),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: appStyle(
                            context, 18, Colors.grey.shade600, FontWeight.w700),
                      ),
                      const HeightSpacer(7),
                      Text(
                        "12/12/2022",
                        style: appStyle(
                            context, 18, Colors.black, FontWeight.w700),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(20),
                Center(
                    child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: HexColor("#991b1b"),
                        borderRadius: BorderRadius.circular(15.w)),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.undo,
                            color: Colors.white,
                          ),
                          const WidthSpacer(10),
                          Text("Revert",
                              style: appStyle(
                                  context, 18, Colors.white, FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                )),
                const HeightSpacer(5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
