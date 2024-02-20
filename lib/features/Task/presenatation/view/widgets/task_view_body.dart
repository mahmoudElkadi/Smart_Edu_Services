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
  const TaskViewBody(
      {super.key,
      this.status,
      this.speciality,
      this.country,
      this.start,
      this.end,
      this.freelancer,
      this.client,
      this.user,
      this.sort});
  final String? status;
  final String? speciality;
  final String? country;
  final String? start;
  final String? end;
  final String? freelancer;
  final String? client;
  final String? user;
  final String? sort;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) => FutureBuilder(
          future: TaskCubit.get(context).myTasks,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              {
                final task = snapshot.data;

                return Padding(
                  padding: EdgeInsets.all(15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              print(TaskCubit.get(context).myTasks);
                              //await TaskCubit.get(context).getTask();
                              TaskCubit.get(context).viewText =
                                  !TaskCubit.get(context).viewText;
                            },
                            child: Text(
                              "Change View To Count >",
                              style: appStyle(
                                  context, 14, Colors.blue, FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomIconButton(
                              onTap: () {
                                Get.to(() => const AddTaskView());
                              },
                              height: 15,
                              color: Colors.white,
                              backGroundColor: HexColor("#00E38C"),
                              text: 'Add New Tasks',
                            ),
                          ),
                        ],
                      ),
                      const HeightSpacer(15),
                      TaskCubit.get(context).viewText == true
                          ? const StatusGridView()
                          : CountSection(taskModel: snapshot.data!),
                      const HeightSpacer(15),
                      const SortByView(),
                      TaskTable(
                        taskModel: task!,
                      ),
                    ],
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return throw Exception(snapshot);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
