import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Client/data/repo/client_repo_impl.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';

import 'client_detials_body.dart';

class ClientDetialsView extends StatelessWidget {
  const ClientDetialsView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientCubit(ClientRepoImpl())
        ..callCountryCubit(context)
        ..callCCurrencyCubit(context)
        ..getOneClient(id),
      child: const Scaffold(
        body: SafeArea(
          child: ClientDetialsViewBody(),
        ),
      ),
    );
  }
}
