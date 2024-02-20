import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Notification/data/repos/note_repo_impl.dart';
import 'package:smart/features/Notification/presentation/manger/note%20cubit/note_cubit.dart';
import 'package:smart/features/Notification/presentation/view/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NoteCubit(NoteRepoImpl())..getNote(),
        child: const NotificationViewBody());
  }
}
