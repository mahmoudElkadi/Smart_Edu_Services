import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_cubit.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_state.dart';
import 'package:smart/features/freelancer/presentation/view/widgets/freelancer_detials_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/dropdownItem.dart';

class FreelancerTaskTable extends StatefulWidget {
  const FreelancerTaskTable({super.key});

  @override
  State<FreelancerTaskTable> createState() => _FreelancerTaskTableState();
}

class _FreelancerTaskTableState extends State<FreelancerTaskTable> {
  var selectedSpeciality;
  var selectedSort;
  String? specialityValue;
  String? sortValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelancerCubit, FreelancerState>(
      builder: (context, state) => FutureBuilder(
          future: FreelancerCubit.get(context).allFreelancer,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final freelancers = snapshot.data;
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
                              height: 25,
                              hintText: "Speciality",
                              selectedValue: selectedSpeciality,
                              items: specialityModel!.specialities
                                  .map((item) => DropdownMenuItem<dynamic>(
                                        value: item,
                                        child: Text(
                                          item.subSpeciality.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (selected) {
                                setState(() {
                                  selectedSpeciality = selected;
                                  specialityValue = selected!.id;
                                  FreelancerCubit.get(context).filterFreelancer(
                                      sort: selectedSort ?? "",
                                      speciality: specialityValue);
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Drop(
                              height: 25,
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
                                  FreelancerCubit.get(context).filterFreelancer(
                                      sort: sortValue,
                                      speciality: specialityValue ?? "");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const HeightSpacer(10),
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
                                  columnSpacing: 20,
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
                                        "Speciality",
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
                                        "Total Cost",
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
                                    freelancers!.freelancers.length,
                                    (index) => DataRow(
                                        cells: <DataCell>[
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(freelancers
                                                  .freelancers[index]
                                                  .freelancername as String))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(freelancers
                                                  .freelancers[index]
                                                  .speciality
                                                  ?.speciality as String))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                freelancers.freelancers[index]
                                                    .tasksCount
                                                    .toString(),
                                              ))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(freelancers
                                                  .freelancers[index]
                                                  .completedCount
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(freelancers
                                                  .freelancers[index].totalGain
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: Text(freelancers
                                                  .freelancers[index]
                                                  .totalProfit
                                                  .toString()))),
                                          DataCell(Align(
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    FreelancerCubit.get(context)
                                                        .deleteFreelancer(
                                                            id: freelancers
                                                                .freelancers[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                            sub: freelancers
                                                                    .freelancers[
                                                                        index]
                                                                    .freelancername
                                                                as String);
                                                  },
                                                  child: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.grey,
                                                  )))),
                                        ],
                                        onSelectChanged: (bool? selected) {
                                          selected == null
                                              ? print('selected is null')
                                              : Get.to(
                                                  () => FreelancerDetialsView(
                                                        id: freelancers
                                                            .freelancers[index]
                                                            .id as String,
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
    ;
  }
}
