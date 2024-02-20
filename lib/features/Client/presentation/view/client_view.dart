import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';
import 'package:smart/features/Client/presentation/view/widgets/system_client_body.dart';

import '../../data/repo/client_repo_impl.dart';

class SystemClientView extends StatelessWidget {
  const SystemClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ClientCubit(ClientRepoImpl())
          ..getClient()
          ..callCountryCubit(context),
        child: const SystemClientBody());
  }
}
