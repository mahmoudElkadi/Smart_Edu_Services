import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/Statuses/presentation/view/widgets/status_table.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import 'add_new_status_view_body.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "System Currencies",
                  style: appStyle(
                      context, 20, Colors.grey.shade700, FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomIconButton(
                    onTap: () {
                      openStatusDialog(context);
                    },
                    color: Colors.white,
                    backGroundColor: HexColor("#00E38C"),
                    fontSize: 16,
                    text: 'Add New Status',
                  ),
                ),
              ],
            ),
            const HeightSpacer(30),
            const StatusTableScreen(),
          ],
        ),
      ),
    );
  }
}
