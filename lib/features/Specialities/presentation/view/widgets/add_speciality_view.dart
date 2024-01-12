import 'package:flutter/material.dart';

import 'add_new_speciality_view_body.dart';

class AddNewSpecialityView extends StatelessWidget {
  const AddNewSpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNewSpecialityViewBody(),
      ),
    );
  }
}
