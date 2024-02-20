import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Users/data/repos/user_repo_impl.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_cubit.dart';

import 'add_User_body.dart';

class AddNewUserView extends StatelessWidget {
  const AddNewUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepoImpl()),
      child: const Scaffold(
        body: SafeArea(
          child: AddNewUserViewBody(),
        ),
      ),
    );
  }
}
