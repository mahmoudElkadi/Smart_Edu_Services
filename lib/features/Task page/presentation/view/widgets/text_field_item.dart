import 'package:flutter/material.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_form_field.dart';

class TaskTextItem extends StatelessWidget {
  const TaskTextItem(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.type});
  final String title;
  final String hint;
  final String? type;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: appStyle(context, 16, Colors.black, FontWeight.w500),
          maxLines: 2,
        ),
        const HeightSpacer(10),
        CustomTextField(
          controller: controller,
          keyboardType: TextInputType.text,
          color: Colors.transparent,
          hintText: hint,
          //label: hint,
          hintColor: Colors.grey,
          validator: (String? value) {
            if (value!.isEmpty) {
              return '$type must not be Empty';
            }
            return null;
          },
        )
      ],
    );
  }
}
