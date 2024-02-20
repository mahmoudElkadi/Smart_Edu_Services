import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/heigher-spacer.dart';

class StatusGridView extends StatelessWidget {
  const StatusGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: status.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.w,
            childAspectRatio: 1.59,
            mainAxisSpacing: 10.h),
        itemBuilder: (context, index) {
          return Container(
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
                          color: status[index][2].withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Icon(
                        status[index][3],
                        color: status[index][2],
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
                        Text(status[index][0],
                            style: appStyle(
                                context, 11, Colors.black, FontWeight.bold)),
                        const HeightSpacer(10),
                        Text(
                          status[index][1],
                          style: appStyle(
                              context, 18, Colors.black, FontWeight.normal),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
