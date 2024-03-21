import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/utils/constant.dart';
import 'package:smart/features/Task/data/repos/task_repo_impl.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';
import 'package:smart/features/Task/presenatation/view/widgets/task_view_body.dart';

import '../manger/Task cubit/Task_cubit.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (status1 != '' ||
        speciality != '' ||
        country != '' ||
        start != '' ||
        end != '' ||
        freelancer != '' ||
        client != '' ||
        user != '' ||
        sort != '') {
      return BlocProvider(
          create: (context) => TaskCubit(TaskRepoImpl())
            ..filterTask(status1, speciality, country, start, end, freelancer,
                client, user, sort)
            ..changeValue()
            ..callClientCubit(context)
            ..callStatusCubit(context)
            ..callSpecialityCubit(context)
            ..callCCurrencyCubit(context),
          child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
            return const SingleChildScrollView(child: TaskViewBody());
          }));
    } else {
      return BlocProvider(
          create: (context) => TaskCubit(TaskRepoImpl())
            ..getTasks()
            ..callClientCubit(context)
            ..callStatusCubit(context)
            ..callSpecialityCubit(context)
            ..callCCurrencyCubit(context),
          child: const TaskViewBody());
    }
  }
}
