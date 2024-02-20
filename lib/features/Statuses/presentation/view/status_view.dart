import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Statuses/data/repos/status_repo_impl.dart';
import 'package:smart/features/Statuses/presentation/manger/Status%20cubit/Status_cubit.dart';
import 'package:smart/features/Statuses/presentation/view/widgets/status_view_body.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => StatusCubit(StatusRepoImpl())..getStatus(),
        child: const StatusViewBody());
  }
}
