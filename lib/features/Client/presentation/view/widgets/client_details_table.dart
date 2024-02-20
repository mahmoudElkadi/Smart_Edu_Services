import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Client/data/models/one_client_model.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_state.dart';

class ClientDetailsTable extends StatelessWidget {
  const ClientDetailsTable({super.key, required this.oneClientModel});
  final OneClientModel oneClientModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) => Container(
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
                        oneClientModel.clientTasks.length,
                        (index) => DataRow(
                          cells: <DataCell>[
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(oneClientModel
                                    .clientTasks[index].serialNumber
                                    .toString()))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(oneClientModel
                                    .clientTasks[index].title
                                    .toString()))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(oneClientModel
                                    .clientTasks[index].client!.clientname
                                    .toString()))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(
                                  oneClientModel.clientTasks[index].profitAmount
                                      .toString(),
                                ))),
                            DataCell(Align(
                                alignment: Alignment.center,
                                child: Text(DateFormat('yyyy-MM-dd HH:mm')
                                    .format(oneClientModel.clientTasks[index]
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
                                      oneClientModel.clientTasks[index]
                                          .taskStatus!.statusname
                                          .toString(),
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
      ),
    );
  }
}
