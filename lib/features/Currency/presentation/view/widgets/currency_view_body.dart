import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/Currency/data/repos/currency_repo_impl.dart';
import 'package:smart/features/Currency/presentation/manger/Task%20cubit/currency_cubit.dart';
import 'package:smart/features/Currency/presentation/manger/Task%20cubit/currency_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import 'add_new_currency_view_body.dart';
import 'currency_table.dart';

class CurrencyViewBody extends StatelessWidget {
  const CurrencyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrenciesCubit(CurrenciesRepoImpl())
        ..callSpecialityCubit(context)
        ..getCurrencies()
        ..callCountryCubit(context),
      child: BlocBuilder<CurrenciesCubit, CurrenciesState>(
          builder: (context, state) => FutureBuilder(
              future: CurrenciesCubit.get(context).myCurrencies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final currency = snapshot.data;

                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15.h),
                      color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "System Currencies",
                                style: appStyle(context, 20,
                                    Colors.grey.shade700, FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Align(
                                alignment: Alignment.centerRight,
                                child: CustomIconButton(
                                  onTap: () {
                                    openCurrenciesDialog(context);
                                  },
                                  color: Colors.white,
                                  backGroundColor: HexColor("#00E38C"),
                                  text: 'Add New Currency',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const HeightSpacer(30),
                          const CurrencyTableScreen(),
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
              })),
    );
  }
}
