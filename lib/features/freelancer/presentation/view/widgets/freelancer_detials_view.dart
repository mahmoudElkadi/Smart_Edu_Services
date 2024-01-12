import 'package:flutter/material.dart';

import 'freelancer_detials_body.dart';

class FreelancerDetialsView extends StatelessWidget {
  const FreelancerDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FreelancerDetialsViewBody(),
      ),
    );
  }
}
