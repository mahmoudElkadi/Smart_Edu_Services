import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';

class TaskDropdownItem extends StatelessWidget {
  const TaskDropdownItem({super.key, required this.title, required this.hint, required this.drobDown, this.onChanged, this.value,});
  final String title;
  final String hint;
  final String? value;
  final Function(String? str)? onChanged;
  final List<String> drobDown;



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
        SizedBox(
          width:MediaQuery.of(context).size.width > 600 ?600.w:250.w,
          child: DropdownButtonFormField<String>(
            decoration:  InputDecoration(
                focusColor: Colors.grey,
                focusedBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                    borderSide:BorderSide(color: Colors.grey,width: 1)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            value:value,
            isDense: true,
            hint:  Text(hint),
            isExpanded: true,
            borderRadius: BorderRadius.circular(10),
            //padding: EdgeInsets.all(15.h),
            onChanged:onChanged as dynamic,
            items: drobDown.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}