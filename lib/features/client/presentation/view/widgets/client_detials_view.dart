import 'package:flutter/material.dart';

import 'client_detials_body.dart';

class ClientDetialsView extends StatelessWidget {
  const ClientDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ClientDetialsViewBody(),
      ),
    );
  }
}
