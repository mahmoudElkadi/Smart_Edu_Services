import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Users/data/repos/user_repo_impl.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_cubit.dart';
import 'package:smart/features/Users/presentation/view/widgets/system_user_view.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserCubit(UserRepoImpl())
          ..getUser()
          ..callCountryCubit(context),
        child: const SystemUserView());
  }
}
