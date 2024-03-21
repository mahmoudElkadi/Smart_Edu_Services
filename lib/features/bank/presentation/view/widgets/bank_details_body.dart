import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/core/widgets/custom_button.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/bank/presentation/view/widgets/transaction_card.dart';
import 'package:smart/features/bank/presentation/view/widgets/transaction_item.dart';

import 'add_transaction.dart';

class BankDetailsBody extends StatelessWidget {
  const BankDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TransactionCard(),
        Padding(
          padding: EdgeInsets.all(15.h).copyWith(top: 0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: CustomButton(
                      text: "Add Transaction",
                      backGroundColor: HexColor("#9ca3af"),
                      color: Colors.white,
                      radius: 10,
                      fontSize: 20,
                      onTap: () {
                        addTransaction(context);
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                      text: "Add Spending",
                      backGroundColor: HexColor("#9ca3af"),
                      color: Colors.white,
                      fontSize: 20,
                      radius: 10,
                      onTap: () {}),
                ),
              ]),
              HeightSpacer(10),
              ListView.separated(
                itemBuilder: (context, index) => TransactionItem(),
                separatorBuilder: (context, index) => const HeightSpacer(10),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
