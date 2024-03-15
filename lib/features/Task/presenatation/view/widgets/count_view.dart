import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/utils/colors.dart' as color;
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/Task_cubit.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../data/model/task_res_model.dart';

class CountSection extends StatelessWidget {
  const CountSection({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) => Column(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(horizontal:30.w ),
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.w),
                border: Border.all(color: Colors.black54, width: 1)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total Sales",
                          style: appStyle(
                              context, 16, Colors.grey, FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "${TaskCubit.get(context).totalGain.toString()} EGP",
                          style: appStyle(
                              context, 16, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Total Profit",
                          style: appStyle(
                              context, 16, Colors.grey, FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "${TaskCubit.get(context).totalProfit.toString()} EGP",
                          style: appStyle(
                              context, 16, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    Text(
                      "Task completion - ${TaskCubit.get(context).totalProfitPercentage.round().toString()}%",
                      style:
                          appStyle(context, 16, Colors.black, FontWeight.w500),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          thumbColor: Colors.green,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0.0)),
                      child: Slider(
                        value: double.parse(TaskCubit.get(context)
                            .totalProfitPercentage
                            .toString()),
                        max: 1000,
                        min: 0,
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        onChanged: (double value) {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const HeightSpacer(15),
          Container(
            padding: EdgeInsets.all(20.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CountItem(
                  title: "Total Gain",
                  price: TaskCubit.get(context).totalGain.toString(),
                ),
                const MyDivider(),
                CountItem(
                  title: "Total Cost",
                  price: TaskCubit.get(context).totalCost.toString(),
                ),
                const MyDivider(),
                CountItem(
                  title: "Total Profit",
                  price: TaskCubit.get(context).totalProfit.toString(),
                ),
                const MyDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        MediaQuery.of(context).size.width < 600
                            ? "Profit %"
                            : "Profit Percentage",
                        style: MediaQuery.of(context).size.width < 600
                            ? appStyle(
                                context, 12, Colors.grey, FontWeight.w400)
                            : appStyle(
                                context, 18, Colors.grey, FontWeight.w400)),
                    const HeightSpacer(20),
                    Text(
                      "${TaskCubit.get(context).totalProfitPercentage.round()}%",
                      style: MediaQuery.of(context).size.width < 600
                          ? appStyle(context, 12, color.Colors.greenColor,
                              FontWeight.bold)
                          : appStyle(context, 18, color.Colors.greenColor,
                              FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CountItem extends StatelessWidget {
  const CountItem({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: MediaQuery.of(context).size.width < 600
                ? appStyle(context, 12, Colors.grey, FontWeight.w400)
                : appStyle(context, 18, Colors.grey, FontWeight.w400)),
        const HeightSpacer(20),
        Text(
          price,
          style: MediaQuery.of(context).size.width < 600
              ? appStyle(context, 12, Colors.black, FontWeight.bold)
              : appStyle(context, 18, Colors.black, FontWeight.bold),
        )
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.w,
      height: 50.h,
      color: Colors.black,
    );
  }
}
