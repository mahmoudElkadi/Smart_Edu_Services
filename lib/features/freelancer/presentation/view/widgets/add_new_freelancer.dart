import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/freelancer/data/repos/freelancer_repo_impl.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_cubit.dart';

import 'add_freelancer_body.dart';

class AddNewFreelancerView extends StatelessWidget {
  const AddNewFreelancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreelancerCubit(FreelancerRepoImpl())
        ..getFreelancer()
        ..callCountryCubit(context)
        ..callCCurrencyCubit(context)
        ..callSpecialityCubit(context),
      child: const Scaffold(
        body: SafeArea(
          child: AddNewFreelancerViewBody(),
        ),
      ),
    );
  }
}
