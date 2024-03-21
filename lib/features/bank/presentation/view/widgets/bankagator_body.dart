import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_cubit.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_state.dart';
import 'package:smart/features/bank/presentation/view/widgets/add_new_bank.dart';
import 'package:smart/features/bank/presentation/view/widgets/bank_details_view.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import 'bank_card.dart';

class BankBody extends StatefulWidget {
  const BankBody({super.key});

  @override
  State<BankBody> createState() => _BankagatorBodyState();
}

class _BankagatorBodyState extends State<BankBody> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<BankCubit, BankState>(
      builder: (context, state) => FutureBuilder(
          future: BankCubit.get(context).allBank,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              {
                final bank = snapshot.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Bank Accounts',
                                    style: appStyle(context, 20, Colors.black,
                                        FontWeight.w700),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  openDialogBank(
                                    context,
                                    "Add New Bank",
                                  );
                                },
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HexColor("#3b82f6"),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        ListView.separated(
                          itemCount: bank!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int itemIndex) {
                            return BankCard(
                              onTap: () {
                                Get.to(() => BankDetails(
                                      id: bank[itemIndex].id.toString(),
                                    ));
                              },
                              onTapDelete: () {
                                BankCubit.get(context).deleteBank(
                                  id: bank[itemIndex].id.toString(),
                                  sub: bank[itemIndex].title.toString(),
                                );
                              },
                              bankModel: bank[itemIndex],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const HeightSpacer(0);
                          },
                        )
                      ],
                    ),
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return throw Exception(snapshot);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
