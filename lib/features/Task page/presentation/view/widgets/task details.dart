import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_cubit.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/TaskDetialsBody.dart';

import '../../../data/repos/details_task_repo_impl.dart';

class TaskDetials extends StatelessWidget {
  const TaskDetials({
    super.key,
    required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsTaskCubit(DetailsTaskRepoImpl())
        ..callCountryCubit(context)
        ..callSpecialityCubit(context)
        ..callCCurrencyCubit(context)
        ..callFreelancerCubit(context)
        ..callClientCubit(context)
        ..getTask(id),
      child: const Scaffold(
        body: TaskDetailsViewBody(),
      ),
    );
  }
}
