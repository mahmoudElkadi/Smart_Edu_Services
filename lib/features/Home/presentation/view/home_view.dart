import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/Home/presentation/view/widgets/TopSection.dart';
import 'package:smart/features/Home/presentation/view/widgets/actionSection.dart';
import 'package:smart/features/Home/presentation/view/widgets/client.dart';
import 'package:smart/features/Home/presentation/view/widgets/freelancerDigram.dart';
import 'package:smart/features/Home/presentation/view/widgets/system_user.dart';
import 'package:smart/features/Home/presentation/view/widgets/task_country.dart';
import 'package:smart/features/Home/presentation/view/widgets/task_digram.dart';
import 'package:smart/features/Home/presentation/view/widgets/top_freelancer.dart';
import 'package:smart/features/Specialities/data/repos/specialty_repo_impl.dart';

import '../../../Specialities/presentation/manger/Task cubit/Specialty_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                SpecialityCubit(SpecialityRepoImpl())..getSpeciality())
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopSection(),
                const ActionSection(),
                SizedBox(height: 20.h),
                const PaymentMethod(),
                SizedBox(height: 20.h),
                const TopFreelancer(),
                SizedBox(height: 20.h),
                const QuickDetails(),
                SizedBox(height: 20.h),
                const TopProducts(),
                SizedBox(height: 20.h),
                const TopProductsId(),
                SizedBox(height: 20.h),
                const ClientView(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
