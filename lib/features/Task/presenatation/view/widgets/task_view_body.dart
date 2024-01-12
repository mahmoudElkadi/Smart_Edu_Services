import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/Task_cubit.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';
import 'package:smart/features/Task/presenatation/view/widgets/count_view.dart';
import 'package:smart/features/Task/presenatation/view/widgets/sort_by.dart';
import 'package:smart/features/Task/presenatation/view/widgets/status_grid_view.dart';
import 'package:smart/features/Task/presenatation/view/widgets/task_table.dart';

import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../Task page/presentation/view/Task_page.dart';

class TaskViewBody extends StatelessWidget {
  const TaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, index) => Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  TaskCubit.get(context).viewText =
                      !TaskCubit.get(context).viewText;
                },
                child: Text(
                  "Change View To Count >",
                  style: appStyle(16, Colors.blue, FontWeight.bold),
                ),
              ),
              const HeightSpacer(10),
              Align(
                alignment: Alignment.centerRight,
                child: CustomIconButton(
                  onTap: () {
                    Get.to(() => const AddTaskView());
                  },
                  color: Colors.white,
                  backGroundColor: HexColor("#00E38C"),
                  width: 210.w,
                  text: 'Add New Tasks',
                ),
              ),
              const HeightSpacer(15),
              TaskCubit.get(context).viewText == true
                  ? const StatusGridView()
                  : const CountSection(),
              const HeightSpacer(15),
              const SortByView(),
              const TaskTable(),
            ],
          ),
        ),
      ),
    );
  }
}
