import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;

import '../../../../../core/utils/app_style.dart';

class SpecialityTableScreen extends StatelessWidget {
  const SpecialityTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DataTable(
                border: TableBorder(
                    horizontalInside:
                        BorderSide(color: Colors.grey.shade100, width: 20.w)),
                dataRowMaxHeight: 80,
                dataRowMinHeight: 50,
                columnSpacing: 50,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey.shade100),
                columns: <DataColumn>[
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      "Sub-Speciality",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style:
                          appStyle(14, color.Colors.blueColor, FontWeight.w500),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      "Speciality",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          appStyle(14, color.Colors.blueColor, FontWeight.w500),
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    style: appStyle(14, Colors.grey.shade100, FontWeight.w500),
                  )),
                ],
                rows: List.generate(
                  5,
                  (index) => DataRow(cells: <DataCell>[
                    DataCell(Align(
                      alignment: MediaQuery.of(context).size.width > 600
                          ? Alignment.centerLeft
                          : Alignment.center,
                      child: const Text(
                        "تطبيقات ومواقع",
                      ),
                    )),
                    const DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(
                        "برمجة",
                      ),
                    )),
                    DataCell(Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.delete_forever,
                            size: 35,
                            color: Colors.grey.shade600,
                          )),
                    ))
                  ]),
                )),
          ),
        ],
      ),
    );
  }
}
