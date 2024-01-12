import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_cubit.dart';
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_state.dart';
import 'package:smart/features/Country/presentation/view/widgets/country_table.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';

class CountryViewBody extends StatelessWidget {
  const CountryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCubit(),
      child: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.h),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "System Countries",
                  style: appStyle(20, Colors.grey.shade700, FontWeight.bold),
                ),
                const HeightSpacer(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: CountryCubit.get(context).viewText == true
                      ? CustomIconButton(
                          onTap: () {
                            CountryCubit.get(context).viewText =
                                !CountryCubit.get(context).viewText;
                          },
                          color: Colors.white,
                          backGroundColor: HexColor("#00E38C"),
                          width: MediaQuery.of(context).size.width > 600
                              ? 240.w
                              : 220.w,
                          text: 'Add New Country',
                        )
                      : Container(
                          height: 1,
                        ),
                ),
                const HeightSpacer(30),
                CountryCubit.get(context).viewText == false
                    ? SafeArea(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TaskTextItem(
                            title: "Country",
                            hint: "Country Name",
                            controller:
                                CountryCubit.get(context).countryController,
                          ),
                          const HeightSpacer(15),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              backGroundColor: Colors.blue,
                              width: 200.w,
                              text: "Add Country",
                              onTap: () async {
                                // Get.to(()=>const EditStatusView());
                              },
                            ),
                          ),
                          const HeightSpacer(50)
                        ],
                      ))
                    : Container(
                        height: 1,
                      ),
                const CountryTableScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
