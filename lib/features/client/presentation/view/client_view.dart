import 'package:flutter/material.dart';
import 'package:smart/features/client/presentation/view/widgets/system_client_body.dart';

class SystemClientView extends StatelessWidget {
  const SystemClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SystemClientBody(),
    );
  }
}
