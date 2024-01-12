import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;

import '../../../../../core/utils/constatnt.dart';

class UserTaskTable extends StatelessWidget {
  const UserTaskTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Task List",
            style: appStyle(18, color.Colors.blueColor, FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.yellow),
                  child: DataTable(
                      border: TableBorder(
                          bottom: BorderSide(),
                          horizontalInside: BorderSide(
                              color: Colors.grey.shade100, width: 20.w)),
                      dataRowMaxHeight: 80,
                      dataRowMinHeight: 70,
                      columnSpacing: 20.0,
                      showCheckboxColumn: true,
                      //horizontalMargin: 50,
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade100),
                      columns: <DataColumn>[
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            "Title",
                            textAlign: TextAlign.center,
                            // overflow: TextOverflow.ellipsis,
                            style: appStyle(
                                14, color.Colors.blueColor, FontWeight.w500),
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            "Client",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(
                                14, color.Colors.blueColor, FontWeight.w500),
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            "Freelancer",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(
                                14, color.Colors.blueColor, FontWeight.w500),
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            "Specialty",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(
                                14, color.Colors.blueColor, FontWeight.w500),
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            "Deadline",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(
                                14, color.Colors.blueColor, FontWeight.w500),
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            "Status",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: appStyle(
                                14, color.Colors.blueColor, FontWeight.w500),
                          ),
                        )),
                      ],
                      rows: List.generate(
                        topProductID().length,
                        (index) => DataRow(
                          cells: <DataCell>[
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(topProductID()[index].itemCount))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(topProductID()[index].salesMan))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                  topProductID()[index].price,
                                ))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(topProductID()[index].profit))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(topProductID()[index].commission))),
                            DataCell(
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 150.w,
                                    height:
                                        MediaQuery.of(context).size.width < 600
                                            ? 50.h
                                            : 30.h,
                                    padding: EdgeInsets.all(10.h),
                                    decoration: BoxDecoration(
                                        color: color.Colors.greenColor
                                            .withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10.w)),
                                    child: Text(
                                      topProductID()[index].date,
                                      textAlign: TextAlign.center,
                                      style: appStyle(
                                          14,
                                          color.Colors.greenColor,
                                          FontWeight.normal),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )

                      // paymentMethod().map(
                      //       (payment)=>DataRow(
                      //           cells: <DataCell>[
                      //   DataCell(Text(payment.payment)),
                      //   DataCell(Text(payment.orders)),
                      //   DataCell(Text(payment.amount))
                      // ]),
                      // ).toList()

                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
