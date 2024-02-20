import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/freelancer/data/model/one_freelancer_model.dart';

class FreelancerDetailsTable extends StatelessWidget {
  const FreelancerDetailsTable({super.key, required this.oneFreelancerModel});
  final OneFreelancerModel oneFreelancerModel;

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
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    dataRowMaxHeight: 80,
                    dataRowMinHeight: 70,
                    columnSpacing: 20.0,
                    showCheckboxColumn: true,
                    //horizontalMargin: 50,
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey.shade200),
                    columns: <DataColumn>[
                      DataColumn(
                          label: Text(
                        "Serial Number",
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(context, 14, color.Colors.blueColor,
                            FontWeight.w500),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text(
                          "Title",
                          textAlign: TextAlign.center,
                          // overflow: TextOverflow.ellipsis,
                          style: appStyle(context, 14, color.Colors.blueColor,
                              FontWeight.w500),
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text(
                          "Client",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(context, 14, color.Colors.blueColor,
                              FontWeight.w500),
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text(
                          "Freelancer",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(context, 14, color.Colors.blueColor,
                              FontWeight.w500),
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text(
                          "Profit",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(context, 14, color.Colors.blueColor,
                              FontWeight.w500),
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text(
                          "Deadline",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(context, 14, color.Colors.blueColor,
                              FontWeight.w500),
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text(
                          "Status",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: appStyle(context, 14, color.Colors.blueColor,
                              FontWeight.w500),
                        ),
                      )),
                    ],
                    rows: List.generate(
                      oneFreelancerModel.freelancerTasks.length,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(oneFreelancerModel
                                  .freelancerTasks[index].serialNumber
                                  .toString()))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(oneFreelancerModel
                                  .freelancerTasks[index].title
                                  .toString()))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(oneFreelancerModel
                                      .freelancerTasks[index].client?.clientname
                                      .toString() ??
                                  "-"))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(
                                oneFreelancerModel.freelancerTasks[index]
                                        .freelancer?.freelancername
                                        .toString() ??
                                    "-",
                              ))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(oneFreelancerModel
                                  .freelancerTasks[index].profitAmount
                                  .toString()))),
                          DataCell(Align(
                              alignment: Alignment.center,
                              child: Text(DateFormat('yyyy-MM-dd HH:mm').format(
                                  oneFreelancerModel.freelancerTasks[index]
                                      .deadline as DateTime)))),
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
                                    oneFreelancerModel.freelancerTasks[index]
                                            .taskStatus?.statusname ??
                                        "-",
                                    textAlign: TextAlign.center,
                                    style: appStyle(
                                        context,
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
        ],
      ),
    );
    ;
  }
}
