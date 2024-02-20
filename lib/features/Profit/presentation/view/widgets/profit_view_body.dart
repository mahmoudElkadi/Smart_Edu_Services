import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/constant.dart';
import 'package:smart/features/Profit/data/repos/profit_repo_impl.dart';
import 'package:smart/features/Profit/presentation/manger/profit%20cubit/profit_cubit.dart';
import 'package:smart/features/Profit/presentation/manger/profit%20cubit/profit_state.dart';
import 'package:smart/features/Profit/presentation/view/widgets/profit_table.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/dropdown_item.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';

class ProfitViewBody extends StatelessWidget {
  const ProfitViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfitCubit(ProfitRepoImpl())
        ..getCustomerProfit()
        ..getSpecialistProfit(),
      child: BlocBuilder<ProfitCubit, ProfitState>(
        builder: (context, state) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.h),
            //color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "System Profit",
                  style: appStyle(
                      context, 20, Colors.grey.shade700, FontWeight.bold),
                ),
                const HeightSpacer(20),
                const ProfitTableScreen(),
                const HeightSpacer(20),
                ProfitCubit.get(context).viewText == false
                    ? Container(
                        height: 1,
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          backGroundColor: Colors.blue,
                          width: 200.w,
                          text: "Edit",
                          onTap: () async {
                            ProfitCubit.get(context).viewText =
                                !ProfitCubit.get(context).viewText;
                          },
                        ),
                      ),
                ProfitCubit.get(context).viewText == false
                    ? TaskDropdownItem(
                        title: "Profit",
                        hint: "Choose Profit",
                        drobDown: ProfitCubit.get(context).profitItem,
                        value: ProfitCubit.get(context).value,
                        onChanged: (newValue) {
                          ProfitCubit.get(context).value = newValue.toString();
                          Get.snackbar("title",
                              ProfitCubit.get(context).value.toString());
                        },
                      )
                    : Container(
                        height: 1,
                      ),
                const HeightSpacer(20),
                ProfitCubit.get(context).value == "Customer Profit" &&
                        ProfitCubit.get(context).viewText == false
                    ? SafeArea(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer Profit",
                            style: appStyle(
                                context, 16, Colors.grey, FontWeight.w900),
                          ),
                          const HeightSpacer(20),
                          TaskTextItem(
                            title: "Profit Max",
                            hint: "Profit Max",
                            controller:
                                ProfitCubit.get(context).profitMaxController,
                          ),
                          const HeightSpacer(15),
                          TaskTextItem(
                            title: "Profit Min",
                            hint: "Profit Min",
                            controller:
                                ProfitCubit.get(context).profitMinController,
                          ),
                          const HeightSpacer(15),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton2(
                              backGroundColor: Colors.blue,
                              width: 200.w,
                              widget:
                                  ProfitCubit.get(context).isLoading == false
                                      ? Text(
                                          "Edit",
                                          style: appStyle(context, 16,
                                              Colors.white, FontWeight.bold),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                              onTap: () async {
                                ProfitCubit.get(context).loading();

                                ProfitCubit.get(context).editAllProfit(
                                    type: 'customer',
                                    id: customerProfitId!,
                                    max: ProfitCubit.get(context)
                                        .profitMaxController
                                        .text,
                                    min: ProfitCubit.get(context)
                                        .profitMinController
                                        .text);
                              },
                            ),
                          ),
                          const HeightSpacer(50)
                        ],
                      ))
                    : ProfitCubit.get(context).value == "Specialist Profit" &&
                            ProfitCubit.get(context).viewText == false
                        ? SafeArea(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Specialist Profit",
                                style: appStyle(
                                    context, 16, Colors.grey, FontWeight.w900),
                              ),
                              const HeightSpacer(20),
                              TaskTextItem(
                                title: "Profit Max",
                                hint: "Profit Max",
                                controller: ProfitCubit.get(context)
                                    .profitMaxController,
                              ),
                              const HeightSpacer(15),
                              TaskTextItem(
                                title: "Profit Min",
                                hint: "Profit Min",
                                controller: ProfitCubit.get(context)
                                    .profitMinController,
                              ),
                              const HeightSpacer(15),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton2(
                                  backGroundColor: Colors.blue,
                                  width: 200.w,
                                  widget: ProfitCubit.get(context).isLoading ==
                                          false
                                      ? Text(
                                          "Edit",
                                          style: appStyle(context, 16,
                                              Colors.white, FontWeight.bold),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                  onTap: () async {
                                    ProfitCubit.get(context).loading();
                                    ProfitCubit.get(context).editAllProfit(
                                        type: 'specialist',
                                        id: specialistProfitId!,
                                        max: ProfitCubit.get(context)
                                            .profitMaxController
                                            .text,
                                        min: ProfitCubit.get(context)
                                            .profitMinController
                                            .text);
                                  },
                                ),
                              ),
                              const HeightSpacer(50)
                            ],
                          ))
                        : Container(
                            height: 1,
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
