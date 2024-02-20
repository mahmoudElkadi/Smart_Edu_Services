import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;

import '../../../../Task page/presentation/view/widgets/task details.dart';
import '../../../data/model/task_res_model.dart';

class TaskTable extends StatefulWidget {
  const TaskTable({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskTable> createState() => _TaskTableState();
}

class _TaskTableState extends State<TaskTable> {
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
            style:
                appStyle(context, 18, color.Colors.blueColor, FontWeight.w500),
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
                        widget.taskModel.tasks.length,
                        (index) => DataRow(
                            cells: <DataCell>[
                              DataCell(Align(
                                  alignment: Alignment.center,
                                  child: Text(widget
                                      .taskModel.tasks[index].serialNumber
                                      .toString()))),
                              DataCell(Align(
                                  alignment: Alignment.center,
                                  child: Text(widget
                                      .taskModel.tasks[index].title
                                      .toString()))),
                              DataCell(Align(
                                  alignment: Alignment.center,
                                  child: Text(widget.taskModel.tasks[index]
                                          .client?.ownerName
                                          .toString() ??
                                      "-"))),
                              DataCell(Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.taskModel.tasks[index].freelancer
                                            ?.freelancername
                                            .toString() ??
                                        "-",
                                  ))),
                              DataCell(Align(
                                  alignment: Alignment.center,
                                  child: Text(widget.taskModel.tasks[index]
                                              .profitAmount ==
                                          null
                                      ? "-"
                                      : widget
                                          .taskModel.tasks[index].profitAmount
                                          .toString()))),
                              DataCell(Align(
                                  alignment: Alignment.center,
                                  child: Text(DateFormat('yyyy-MM-dd HH:mm')
                                      .format(widget.taskModel.tasks[index]
                                          .deadline as DateTime)))),
                              DataCell(
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 150.w,
                                      height:
                                          MediaQuery.of(context).size.width <
                                                  600
                                              ? 50.h
                                              : 30.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                          color: widget.taskModel.tasks[index]
                                                      .taskStatus?.statusname
                                                      .toString() ==
                                                  "working on"
                                              ? Colors.red.withOpacity(0.1)
                                              : color.Colors.blueColor
                                                  .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10.w)),
                                      child: Text(
                                        widget.taskModel.tasks[index].taskStatus
                                                ?.statusname
                                                .toString() ??
                                            '-',
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
                            onSelectChanged: (bool? selected) {
                              Get.to(() => TaskDetials(
                                  id: widget.taskModel.tasks[index].id
                                      .toString()));
                            }),
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
