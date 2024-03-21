import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/core/utils/constant.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../data/models/speciality_model.dart';
import '../../manger/Task cubit/Specialty_cubit.dart';
import '../../manger/Task cubit/Specialty_state.dart';
import 'edit_specailty_view.dart';

class SpecialityTableScreen extends StatelessWidget {
  const SpecialityTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) => FutureBuilder(
          future: SpecialityCubit.get(context).mySpeciality,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final speciality = snapshot.data;
              for (Speciality item in speciality!.specialities) {
                specialityList.add(MyObject(
                    item.subSpeciality.toString(), item.id.toString()));
              }
              print(specialityList[0].name);

              return Container(
                padding: EdgeInsets.all(10.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
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
                                    color: Colors.grey.shade100, width: 20.w)),
                            dataRowMaxHeight: 80,
                            dataRowMinHeight: 50,
                            columnSpacing: 50,
                            showCheckboxColumn: false,
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade100),
                            columns: <DataColumn>[
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "Sub-Speciality",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: appStyle(context, 14,
                                      color.Colors.blueColor, FontWeight.w500),
                                ),
                              )),
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "Speciality",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: appStyle(context, 14,
                                      color.Colors.blueColor, FontWeight.w500),
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
                                speciality.specialities.length,
                                (index) => DataRow(
                                        cells: <DataCell>[
                                          DataCell(Align(
                                            alignment: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    600
                                                ? Alignment.centerLeft
                                                : Alignment.center,
                                            child: Text(
                                              speciality.specialities[index]
                                                  .subSpeciality as String,
                                            ),
                                          )),
                                          DataCell(Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              speciality.specialities[index]
                                                  .speciality as String,
                                            ),
                                          )),
                                          DataCell(Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                                onTap: () {
                                                  SpecialityCubit.get(context)
                                                      .deleteSpecialist(
                                                          id: speciality
                                                              .specialities[
                                                                  index]
                                                              .id as String,
                                                          sub: speciality
                                                                  .specialities[
                                                                      index]
                                                                  .subSpeciality
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
                                              : Get.to(() => EditSpecialityView(
                                                    id: speciality
                                                        .specialities[index]
                                                        .id as String,
                                                  ));
                                        })),
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
