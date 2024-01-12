import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/constatnt.dart';

class SortByView extends StatelessWidget {
  const SortByView({super.key});

  @override
  Widget build(BuildContext context) {
    String? value;

    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(FontAwesomeIcons.arrowDownShortWide,
          size: 30,
          ),
          SizedBox(
            width: 200.w,
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
              hint: const Text("Sort by"),
              isExpanded: true,
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.all(15.h),
              onChanged: (newValue){
                value=newValue;
              },
              items: store.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
