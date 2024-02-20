import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Specialities/data/repos/specialty_repo_impl.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_cubit.dart';

import 'edit_speciality_body.dart';

class EditSpecialityView extends StatelessWidget {
  const EditSpecialityView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpecialityCubit(SpecialityRepoImpl())..getOneSpecialty(id),
      child: Scaffold(
        body: SafeArea(
          child: EditSpecialityViewBody(
            id: id,
          ),
        ),
      ),
    );
  }
}
