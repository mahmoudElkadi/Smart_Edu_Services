import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/freelancer/data/repos/freelancer_repo_impl.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_cubit.dart';

import 'freelancer_detials_body.dart';

class FreelancerDetialsView extends StatelessWidget {
  const FreelancerDetialsView({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreelancerCubit(FreelancerRepoImpl())
        ..getOneFreelancer(id)
        ..callSpecialityCubit(context)
        ..callCCurrencyCubit(context)
        ..callCountryCubit(context),
      child: const Scaffold(
        body: SafeArea(
          child: FreelancerDetialsViewBody(),
        ),
      ),
    );
  }
}
