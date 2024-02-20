import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Client/data/repo/client_repo_impl.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';

import 'add_client_body.dart';

class AddNewClientView extends StatelessWidget {
  const AddNewClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientCubit(ClientRepoImpl())
        ..callCountryCubit(context)
        ..callCCurrencyCubit(context),
      child: const Scaffold(
        body: SafeArea(
          child: AddNewClientViewBody(),
        ),
      ),
    );
  }
}
