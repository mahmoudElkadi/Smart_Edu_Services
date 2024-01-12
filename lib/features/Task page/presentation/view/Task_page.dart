import 'package:flutter/material.dart';
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
    DateTimeRange selectedDates =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());

    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddTaskViewBody(),
    );
  }
}
