import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_cubit.dart';

import '../../../../../core/utils/app_style.dart';
import '../../manger/country cubit/Country_state.dart';

class CountryTableScreen extends StatelessWidget {
  const CountryTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) => FutureBuilder(
          future: CountryCubit.get(context).allCountry,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final country = snapshot.data;
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
                                "Countries",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: appStyle(context, 14,
                                    color.Colors.blueColor, FontWeight.w500),
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "",
                              overflow: TextOverflow.ellipsis,
                              style: appStyle(context, 14, Colors.grey.shade100,
                                  FontWeight.w500),
                            )),
                          ],
                          rows: List.generate(
                            country!.countries.length,
                            (index) => DataRow(cells: <DataCell>[
                              DataCell(Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  country.countries[index].countryName
                                      as String,
                                ),
                              )),
                              DataCell(Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      CountryCubit.get(context).deleteCountry(
                                          id: country.countries[index].id
                                              as String,
                                          country: country.countries[index]
                                              .countryName as String);
                                    },
                                    child: Icon(
                                      Icons.delete_forever,
                                      size: 35,
                                      color: Colors.grey.shade600,
                                    )),
                              ))
                            ]),
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
