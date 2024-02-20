import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Task%20page/data/repos/details_task_repo_impl.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_cubit.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/add_task.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController currencyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? dateStartValue;
  String? dateEndValue;

  @override
  void dispose() {
    currencyController.dispose();
    priceController.dispose();
    statusController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsTaskCubit(DetailsTaskRepoImpl())..getCustomer(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: AddTaskViewBody(),
      ),
    );
  }
}
