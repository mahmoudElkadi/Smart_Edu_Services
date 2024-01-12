import 'package:flutter/material.dart';
import 'package:smart/features/Users/presentation/view/widgets/user_detials_body.dart';

class UserDetialsView extends StatelessWidget {
  const UserDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserDetialsBody(),
    );
  }
}
