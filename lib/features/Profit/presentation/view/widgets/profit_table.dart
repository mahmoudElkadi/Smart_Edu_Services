import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;

import '../../../../../core/utils/app_style.dart';

class ProfitTableScreen extends StatelessWidget {
  const ProfitTableScreen({super.key});

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
                      "Profit",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          appStyle(14, color.Colors.blueColor, FontWeight.w500),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      "Max",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          appStyle(14, color.Colors.blueColor, FontWeight.w500),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      "Min",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          appStyle(14, color.Colors.blueColor, FontWeight.w500),
                    ),
                  )),
                ],
                rows: List.generate(
                  2,
                  (index) => const DataRow(cells: <DataCell>[
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Customer Profit",
                      ),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(
                        "60",
                      ),
                    )),
                    DataCell(Align(
                      alignment: Alignment.center,
                      child: Text(
                        "40",
                      ),
                    )),
                  ]),
                )),
          ),
        ],
      ),
    );
  }
}
