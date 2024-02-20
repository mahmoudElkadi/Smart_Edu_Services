import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/freelancer/data/repos/freelancer_repo_impl.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_cubit.dart';
import 'package:smart/features/freelancer/presentation/view/widgets/system_freelancer_view.dart';

class FreelancerView extends StatelessWidget {
  const FreelancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FreelancerCubit(FreelancerRepoImpl())
          ..getFreelancer()
          ..callSpecialityCubit(context),
        child: const SystemFreelancerView());
  }
}
