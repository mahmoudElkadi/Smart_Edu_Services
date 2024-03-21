import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/bank/data/repos/bank_repo_impl.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_cubit.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_state.dart';
import 'package:smart/features/bank/presentation/view/widgets/bankagator_body.dart';

class Bank extends StatelessWidget {
  const Bank({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BankCubit(BankRepoImpl())
          ..callCCurrencyCubit(context)
          ..getBank(),
        child: BlocBuilder<BankCubit, BankState>(
            builder: (context, state) => const BankBody()));
  }
}
