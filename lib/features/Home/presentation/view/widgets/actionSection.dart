import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;

import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task/presenatation/view/widgets/count_view.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    ? appStyle(12, color.Colors.blueColor, FontWeight.bold)
                    : appStyle(18, color.Colors.greenColor, FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
