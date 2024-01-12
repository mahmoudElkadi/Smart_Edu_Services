import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Column(
            children: [
              const HeightSpacer(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Notifications",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                ],
              ),
              const HeightSpacer(30),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10.h),
                      width: MediaQuery.of(context).size.width,
                      height: 170.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.yellow.shade200,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.error,
                                    color: Colors.yellow.shade600, size: 30),
                              ),
                              const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.close,
                                    size: 30,
                                  ))
                            ],
                          ),
                          const HeightSpacer(15),
                          Text(
                            "Task 124121 has been delivered to client by Ahmed Nayel",
                            maxLines: 2,
                            style: appStyle(14, Colors.black, FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const HeightSpacer(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.watch_later_outlined,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "11/12/2024 01:33 AM",
                                style:
                                    appStyle(14, Colors.grey, FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const HeightSpacer(50);
                  },
                  itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
