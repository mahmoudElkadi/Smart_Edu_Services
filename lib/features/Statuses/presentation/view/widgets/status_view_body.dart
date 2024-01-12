import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/Statuses/presentation/view/widgets/add_status_view.dart';
import 'package:smart/features/Statuses/presentation/view/widgets/status_table.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/heigher-spacer.dart';

class StatusViewBody extends StatelessWidget {
  const StatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.h),
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "System Currencies",
              style: appStyle(20, Colors.grey.shade700, FontWeight.bold),
            ),
            const HeightSpacer(20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomIconButton(
                onTap: () {
                  Get.to(() => const AddNewStatusView());
                },
                color: Colors.white,
                backGroundColor: HexColor("#00E38C"),
                width: MediaQuery.of(context).size.width > 600 ? 240.w : 220.w,
                text: 'Add New Status',
              ),
            ),
            const HeightSpacer(30),
            const StatusTableScreen(),
          ],
        ),
      ),
    );
  }
}
