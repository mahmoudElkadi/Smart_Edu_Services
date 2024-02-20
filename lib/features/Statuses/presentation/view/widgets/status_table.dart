import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Statuses/data/repos/status_repo_impl.dart';
import 'package:smart/features/Statuses/presentation/view/widgets/edit_details_status_view_body.dart';

import '../../../../../core/utils/app_style.dart';
import '../../manger/Status cubit/Status_cubit.dart';
import '../../manger/Status cubit/Status_state.dart';

class StatusTableScreen extends StatelessWidget {
  const StatusTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatusCubit(StatusRepoImpl())..getStatus(),
      child: BlocBuilder<StatusCubit, StatusState>(
        builder: (context, state) => FutureBuilder(
            future: StatusCubit.get(context).myStatus,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final status = snapshot.data;
                return Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    width: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(
                              border: TableBorder(
                                  horizontalInside: BorderSide(
                                      color: Colors.grey.shade100,
                                      width: 20.w)),
                              dataRowMaxHeight: 80,
                              dataRowMinHeight: 50,
                              columnSpacing: 30,
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey.shade100),
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Expanded(
                                  child: Text(
                                    "Name",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: appStyle(
                                        context,
                                        14,
                                        color.Colors.blueColor,
                                        FontWeight.w500),
                                  ),
                                )),
                                DataColumn(
                                    label: Expanded(
                                  child: Text(
                                    "Role",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: appStyle(
                                        context,
                                        16,
                                        color.Colors.blueColor,
                                        FontWeight.w500),
                                  ),
                                )),
                                DataColumn(
                                    label: Text(
                                  "",
                                  overflow: TextOverflow.ellipsis,
                                  style: appStyle(context, 14,
                                      Colors.grey.shade100, FontWeight.w500),
                                )),
                              ],
                              rows: List.generate(
                                status!.statuses.length,
                                (index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Align(
                                        alignment:
                                            MediaQuery.of(context).size.width >
                                                    600
                                                ? Alignment.center
                                                : Alignment.center,
                                        child: Text(
                                          status.statuses[index].statusname
                                              as String,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataCell(Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          status.statuses[index].role as String,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      DataCell(Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              StatusCubit.get(context)
                                                  .deleteStatus(
                                                      id: status.statuses[index]
                                                          .id as String,
                                                      name: status
                                                              .statuses[index]
                                                              .statusname
                                                          as String);
                                            },
                                            child: Icon(
                                              Icons.delete_forever,
                                              size: 35,
                                              color: Colors.grey.shade600,
                                            )),
                                      ))
                                    ],
                                    onSelectChanged: (bool? selected) {
                                      selected == null
                                          ? print('selected is null')
                                          : editStatusDialog(
                                              context,
                                              status.statuses[index].id
                                                  as String);
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return throw Exception(snapshot.error);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
