import 'package:flutter/material.dart';
import 'package:smart/features/Account/presentation/view/widgets/add_new_account_view_body.dart';

class AddNewAccountView extends StatelessWidget {
  const AddNewAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNewAccountViewBody(),
      ),
    );
  }
}
