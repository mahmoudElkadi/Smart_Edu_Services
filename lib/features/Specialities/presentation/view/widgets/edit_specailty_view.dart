import 'package:flutter/material.dart';
import 'edit_speciality_body.dart';

class EditSpecialityView extends StatelessWidget {
  const EditSpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditSpecialityViewBody(),
      ),
    );
  }
}
