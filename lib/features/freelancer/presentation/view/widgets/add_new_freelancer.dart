import 'package:flutter/material.dart';

import 'add_freelancer_body.dart';


class AddNewFreelancerView extends StatelessWidget {
  const AddNewFreelancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNewFreelancerViewBody(),
      ),
    );
  }
}
