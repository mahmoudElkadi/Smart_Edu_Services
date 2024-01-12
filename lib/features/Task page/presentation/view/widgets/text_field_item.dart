import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_form_field.dart';


class TaskTextItem extends StatelessWidget {
  const TaskTextItem({super.key, required this.title, required this.hint, required this.controller});
  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(title,
            style: appStyle(16, Colors.black, FontWeight.w500),
            maxLines: 2,
          ),
        ),
        CustomTextField(
          controller: controller,
          keyboardType: TextInputType.text,
          color: Colors.transparent,
          label: hint,
          hintColor: Colors.black,
          width: MediaQuery.of(context).size.width > 600 ?600.w:250.w,
        )
      ],
    );
  }
}