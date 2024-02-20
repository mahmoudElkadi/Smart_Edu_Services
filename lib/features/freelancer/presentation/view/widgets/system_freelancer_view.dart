import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/freelancer/presentation/view/widgets/task_freelancer_table.dart';

import '../../../../../core/widgets/custom_button_icon.dart';
import 'add_new_freelancer.dart';

class SystemFreelancerView extends StatefulWidget {
  const SystemFreelancerView({super.key});

  @override
  State<SystemFreelancerView> createState() => _SystemFreelancerViewState();
}

class _SystemFreelancerViewState extends State<SystemFreelancerView> {
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
                  "Freelancers",
                  style: appStyle(
                      context, 18, Colors.grey.shade700, FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomIconButton(
                    onTap: () {
                      Get.to(() => const AddNewFreelancerView());
                    },
                    color: Colors.white,
                    backGroundColor: HexColor("#00E38C"),
                    height: 10,
                    text: 'Add New Freelancer',
                  ),
                ),
              ],
            ),
            const HeightSpacer(10),
            const FreelancerTaskTable(),
          ],
        ),
      ),
    );
  }
}
