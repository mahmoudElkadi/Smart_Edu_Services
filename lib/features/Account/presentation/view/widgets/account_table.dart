import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Account/presentation/view/widgets/add_new_account_view_body.dart';

import '../../../../../core/utils/app_style.dart';
import '../../manger/Account cubit/Account_cubit.dart';
import '../../manger/Account cubit/Account_state.dart';

class AccountTableScreen extends StatelessWidget {
  const AccountTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) => FutureBuilder(
          future: AccountCubit.get(context).myAccounts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final account = snapshot.data;
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
                              horizontalInside: BorderSide(
                                  color: Colors.grey.shade100, width: 20.w)),
                          dataRowMaxHeight: 80,
                          dataRowMinHeight: 50,
                          columnSpacing: 50,
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey.shade100),
                          columns: <DataColumn>[
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                "Name",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: appStyle(context, 14,
                                    color.Colors.blueColor, FontWeight.w500),
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                "Type",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: appStyle(context, 14,
                                    color.Colors.blueColor, FontWeight.w500),
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Balance",
                              overflow: TextOverflow.ellipsis,
                              style: appStyle(context, 14,
                                  color.Colors.blueColor, FontWeight.w500),
                            )),
                          ],
                          rows: List.generate(
                            account!.length,
                            (index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    child: Align(
                                      alignment:
                                          MediaQuery.of(context).size.width >
                                                  600
                                              ? Alignment.centerLeft
                                              : Alignment.center,
                                      child: Text(
                                        account[index].title == null
                                            ? "-"
                                            : account[index].title as String,
                                      ),
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      account[index].type as String,
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      account[index].balance.toString(),
                                    ),
                                  ))
                                ],
                                onSelectChanged: (bool? selected) {
                                  selected == null
                                      ? print('selected is null')
                                      : openAccountDialog(
                                          context, account[index].id);
                                }),
                          )),
                    ),
                  ],
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
    );
  }
}
