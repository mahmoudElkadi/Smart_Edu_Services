import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w, bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Task By Country ",
            style: appStyle(context, 22, Colors.black, FontWeight.w500),
          ),
          const HeightSpacer(25),
          Container(
            height: 300.h,
            margin: EdgeInsets.only(bottom: 10.h, right: 15.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.separated(
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Egypt",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        "35%",
                        style: appStyle(
                            context, 16, Colors.black, FontWeight.w500),
                      ),
                      Text(
                        "365",
                        style: appStyle(
                            context, 16, Colors.black, FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black26,
                  ),
                );
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
