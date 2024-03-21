import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Currency/presentation/manger/Task%20cubit/currency_cubit.dart';
import 'package:smart/features/Currency/presentation/manger/Task%20cubit/currency_state.dart';
import 'package:smart/features/Currency/presentation/view/widgets/edit_currency_body.dart';

import '../../../../../core/utils/app_style.dart';

class CurrencyTableScreen extends StatelessWidget {
  const CurrencyTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesCubit, CurrenciesState>(
        builder: (context, state) => FutureBuilder(
            future: CurrenciesCubit.get(context).myCurrencies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final currency = snapshot.data;
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
                            showCheckboxColumn: false,
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade100),
                            columns: <DataColumn>[
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "Currency Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: appStyle(context, 14,
                                      color.Colors.blueColor, FontWeight.w500),
                                ),
                              )),
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  "Price in EGP",
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
                              currency!.currencies.length,
                              (index) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(Align(
                                      alignment:
                                          MediaQuery.of(context).size.width >
                                                  600
                                              ? Alignment.centerLeft
                                              : Alignment.center,
                                      child: Row(
                                        children: [
                                          Text(
                                            currency.currencies[index]
                                                .currencyname as String,
                                          ),
                                        ],
                                      ),
                                    )),
                                    DataCell(Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        currency.currencies[index].priceToEgp
                                            .toString(),
                                      ),
                                    )),
                                    DataCell(Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            CurrenciesCubit.get(context)
                                                .deleteCurrency(
                                                    id: currency
                                                        .currencies[index].id
                                                        .toString(),
                                                    sub: currency
                                                            .currencies[index]
                                                            .currencyname
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
                                        : editCurrenciesDialog(
                                            context,
                                            currency.currencies[index].id
                                                as String);
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
            }));
  }
}
