import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../manger/client cubit/client_state.dart';
import 'client_detials_view.dart';

class ClientTaskTable extends StatefulWidget {
  const ClientTaskTable({
    super.key,
  });

  @override
  State<ClientTaskTable> createState() => _ClientTaskTableState();
}

class _ClientTaskTableState extends State<ClientTaskTable> {
  var selectedCountry;
  var selectedSort;
  String? countryValue;
  String? sortValue;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) => FutureBuilder(
          future: ClientCubit.get(context).allClient,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final client = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Drop(
                              height: 30,
                              hintText: "Country",
                              selectedValue: selectedCountry,
                              items: countryModel!.countries
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.countryName.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedCountry = selected;
                                  countryValue = selected!.id;
                                  ClientCubit.get(context).filterClient(
                                      sort: selectedSort ?? "",
                                      country: countryValue);
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Drop(
                              height: 30,
                              hintText: 'Sort By',
                              selectedValue: sortValue,
                              items: freelancerSort
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedSort = selected;
                                  sortValue = selected;
                                  ClientCubit.get(context).filterClient(
                                      sort: sortValue,
                                      country: countryValue ?? "");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const HeightSpacer(20),
                      Text(
                        "Task List",
                        style: appStyle(context, 18, color.Colors.blueColor,
                            FontWeight.w500),
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
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.yellow),
                              child: DataTable(
                                  border: TableBorder(
                                      horizontalInside: BorderSide(
                                          color: Colors.grey.shade100,
                                          width: 20.w)),
                                  dataRowMaxHeight: 80,
                                  dataRowMinHeight: 70,
                                  columnSpacing: 20.0,
                                  showCheckboxColumn: false,
                                  //horizontalMargin: 50,
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.grey.shade100),
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: Expanded(
                                      child: Text(
                                        "Name",
                                        textAlign: TextAlign.center,
                                        // overflow: TextOverflow.ellipsis,
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
                                        "Country",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
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
                                        "Task Count",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
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
                                        "Completed Task",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
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
                                        "Total Gain",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
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
                                        "Total Profit",
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
                                        "",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: appStyle(
                                            context,
                                            14,
                                            color.Colors.blueColor,
                                            FontWeight.w500),
                                      ),
                                    )),
                                  ],
                                  rows: List.generate(
                                    client!.clients.length,
                                    (index) => DataRow(
                                        cells: <DataCell>[
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(client
                                                  .clients[index].clientname
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(client.clients[index]
                                                  .country!.countryName
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                client.clients[index].tasksCount
                                                    .toString(),
                                              ))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(client
                                                  .clients[index].completedCount
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(client
                                                  .clients[index].totalGain
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(client
                                                  .clients[index].totalProfit
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                onTap: () {
                                                  ClientCubit.get(context)
                                                      .deleteClient(
                                                          id: client
                                                              .clients[index].id
                                                              .toString(),
                                                          sub: client
                                                              .clients[index]
                                                              .clientname
                                                              .toString());
                                                },
                                                child: const Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.grey,
                                                ),
                                              ))),
                                        ],
                                        onSelectChanged: (bool? selected) {
                                          selected == null
                                              ? print('selected is null')
                                              : Get.to(() => ClientDetialsView(
                                                    id: client.clients[index].id
                                                        as String,
                                                  ));
                                        }),
                                  )),
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
    );
  }
}
