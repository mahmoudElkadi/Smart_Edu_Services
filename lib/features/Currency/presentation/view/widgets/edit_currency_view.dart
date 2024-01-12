import 'package:flutter/material.dart';
import 'package:smart/features/Currency/presentation/view/widgets/edit_currency_body.dart';

class EditCurrencyView extends StatelessWidget {
  const EditCurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditCurrencyViewBody(),
      ),
    );
  }
}
