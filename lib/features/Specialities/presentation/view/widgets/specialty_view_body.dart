import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/Specialities/presentation/view/widgets/speciality_table.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import 'add_speciality_view.dart';

class SpecialtyViewBody extends StatelessWidget {
  const SpecialtyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "System Specialities",
            style: appStyle(20, Colors.grey.shade700, FontWeight.bold),
          ),
          const HeightSpacer(20),
          Align(
            alignment: Alignment.centerRight,
            child: CustomIconButton(
              onTap: () {
                Get.to(() => const AddNewSpecialityView());
              },
              color: Colors.white,
              backGroundColor: HexColor("#00E38C"),
              width: MediaQuery.of(context).size.width > 600 ? 240.w : 220.w,
              text: 'Add New Speciality',
            ),
          ),
          const HeightSpacer(30),
          const SpecialityTableScreen(),
        ],
      ),
    );
  }
}
