import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Account/data/repos/account_repo_impl.dart';
import 'package:smart/features/Account/presentation/view/widgets/account_view_boby.dart';

import '../manger/Account cubit/Account_cubit.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AccountCubit(AccountRepoImpl())..getAccount(),
        child: const AccountViewBody());
  }
}
