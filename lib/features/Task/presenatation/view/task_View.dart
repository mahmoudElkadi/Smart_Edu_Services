import 'package:flutter/material.dart';
import 'package:smart/features/Task/presenatation/view/widgets/task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: TaskViewBody());
  }
}
