import 'package:flutter/material.dart';

import 'add_User_body.dart';

class AddNewUserView extends StatelessWidget {
  const AddNewUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddNewUserViewBody(),
      ),
    );
  }
}
