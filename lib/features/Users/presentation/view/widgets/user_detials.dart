import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Users/data/repos/user_repo_impl.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_cubit.dart';
import 'package:smart/features/Users/presentation/view/widgets/user_detials_body.dart';

class UserDetialsView extends StatelessWidget {
  const UserDetialsView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepoImpl())
        ..getOneUser(id)
        ..callCountryCubit(context)
        ..callSpecialityCubit(context),
      child: const Scaffold(
        body: UserDetialsBody(),
      ),
    );
  }
}
