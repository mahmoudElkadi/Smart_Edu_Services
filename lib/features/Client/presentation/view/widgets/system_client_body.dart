import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/widgets/custom_button_icon.dart';
import 'add_new_client.dart';
import 'client_task_table.dart';

class SystemClientBody extends StatefulWidget {
  const SystemClientBody({super.key});

  @override
  State<SystemClientBody> createState() => _SystemClientBodyState();
}

class _SystemClientBodyState extends State<SystemClientBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.h),
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "System Clients",
                  style: appStyle(
                      context, 20, Colors.grey.shade700, FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomIconButton(
                    onTap: () {
                      Get.to(() => const AddNewClientView());
                    },
                    height: 15,
                    color: Colors.white,
                    backGroundColor: HexColor("#00E38C"),
                    text: 'Add New Client',
                  ),
                ),
              ],
            ),
            const HeightSpacer(20),
            const ClientTaskTable(),
          ],
        ),
      ),
    );
  }
}
