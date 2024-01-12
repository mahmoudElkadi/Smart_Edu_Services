import 'package:flutter/material.dart';
import 'package:smart/features/Statuses/presentation/view/widgets/add_new_status_view_body.dart';

class AddNewStatusView extends StatelessWidget {
  const AddNewStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNewStatusViewBody(),
      ),
    );
  }
}
