import 'package:flutter/material.dart';
import 'package:smart/features/Currency/presentation/view/widgets/add_new_currency_view_body.dart';

class AddNewCurrencyView extends StatelessWidget {
  const AddNewCurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNewCurrencyViewBody(),
      ),
    );
  }
}
