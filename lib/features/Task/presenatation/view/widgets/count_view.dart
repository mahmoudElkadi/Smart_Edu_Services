import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';

class CountSection extends StatelessWidget {
  const CountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.symmetric(horizontal:30.w ),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w),
              border: Border.all(color: Colors.black54, width: 1)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Sales",
                        style: appStyle(16, Colors.grey, FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "800500 EGP",
                        style: appStyle(16, Colors.black, FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Total Profit",
                        style: appStyle(16, Colors.grey, FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "400250 EGP",
                        style: appStyle(16, Colors.black, FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  Text(
                    "Task completion - 90%",
                    style: appStyle(16, Colors.black, FontWeight.w500),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbColor: Colors.green,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0.0)),
                    child: Slider(
                      value: 90,
                      max: 100,
                      min: 0,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                      onChanged: (double value) {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const HeightSpacer(15),
        Container(
          padding: EdgeInsets.all(20.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CountItem(
                title: "Total Gain",
                price: "656245",
              ),
              const MyDivider(),
              const CountItem(
                title: "Total Cost",
                price: "265142",
              ),
              const MyDivider(),
              const CountItem(
                title: "Total Profit",
                price: "700000",
              ),
              const MyDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      MediaQuery.of(context).size.width < 600
                          ? "Profit %"
                          : "Profit Percentage",
                      style: MediaQuery.of(context).size.width < 600
                          ? appStyle(12, Colors.grey, FontWeight.w400)
                          : appStyle(18, Colors.grey, FontWeight.w400)),
                  const HeightSpacer(20),
                  Text(
                    "37%",
                    style: MediaQuery.of(context).size.width < 600
                        ? appStyle(12, color.Colors.greenColor, FontWeight.bold)
                        : appStyle(
                            18, color.Colors.greenColor, FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CountItem extends StatelessWidget {
  const CountItem({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: MediaQuery.of(context).size.width < 600
                ? appStyle(12, Colors.grey, FontWeight.w400)
                : appStyle(18, Colors.grey, FontWeight.w400)),
        const HeightSpacer(20),
        Text(
          price,
          style: MediaQuery.of(context).size.width < 600
              ? appStyle(12, Colors.black, FontWeight.bold)
              : appStyle(18, Colors.black, FontWeight.bold),
        )
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.w,
      height: 50.h,
      color: Colors.black,
    );
  }
}
