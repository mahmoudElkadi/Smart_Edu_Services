import 'package:flutter/material.dart';

import 'add_client_body.dart';


class AddNewClientView extends StatelessWidget {
  const AddNewClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNewClientViewBody(),
      ),
    );
  }
}
