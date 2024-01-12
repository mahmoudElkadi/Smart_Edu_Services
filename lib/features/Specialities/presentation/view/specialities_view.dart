import 'package:flutter/material.dart';
import 'package:smart/features/Specialities/presentation/view/widgets/specialty_view_body.dart';

class SpecialtyView extends StatelessWidget {
  const SpecialtyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: SpecialtyViewBody());
  }
}
