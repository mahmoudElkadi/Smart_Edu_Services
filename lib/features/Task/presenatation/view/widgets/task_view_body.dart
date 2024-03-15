import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/Task_cubit.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';
import 'package:smart/features/Task/presenatation/view/widgets/status_grid_view.dart';
import 'package:smart/features/Task/presenatation/view/widgets/task_item.dart';

import '../../../../../core/widgets/custom_button_icon.dart';
import '../../../../Task page/presentation/view/Task_page.dart';
import 'count_view.dart';

class TaskViewBody extends StatefulWidget {
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
  State<TaskViewBody> createState() => _TaskViewBodyState();
}

class _TaskViewBodyState extends State<TaskViewBody> {
  @override
  void initState() {
    TaskCubit.get(context).pagination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) => Builder(builder: (context) {
        final tasks =
            TaskCubit.get(context).response; // Access tasks directly from Cubit
        final isLoading =
            TaskCubit.get(context).state is TasksLoading; // Check loading state
        final hasError = TaskCubit.get(context).state is TasksError;

        if (isLoading && tasks == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (hasError) {
          final error = (TaskCubit.get(context).state as TasksError).message;
          return throw Exception(error);
        } else {
          return SingleChildScrollView(
            controller: TaskCubit.get(context).scrollController,
            child: Padding(
              padding: EdgeInsets.all(15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            TaskCubit.get(context).viewText =
                                !TaskCubit.get(context).viewText;
                          });
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
                      : CountSection(taskModel: tasks!),
                  const HeightSpacer(15),
                  ListView.separated(
                    physics:
                        const NeverScrollableScrollPhysics(), // Enable scrolling
                    shrinkWrap: true, // Adjust based on your layout needs
                    itemBuilder: (context, index) {
                      if (index == TaskCubit.get(context).tasks.length - 1 &&
                          TaskCubit.get(context).isLoadMore) {
                        return const Center(
                            child:
                                CircularProgressIndicator()); // Show loading indicator
                      }
                      return TaskItem(
                        color: Colors.blue,
                        task: TaskCubit.get(context).tasks[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const HeightSpacer(15),
                    itemCount: TaskCubit.get(context)
                        .tasks
                        .length, // Use Cubit's tasks
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
