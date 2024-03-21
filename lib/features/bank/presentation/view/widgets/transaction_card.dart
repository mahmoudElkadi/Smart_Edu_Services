import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_cubit.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Main/presentation/views/main_view.dart';
import 'edit_bank.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<BankCubit, BankState>(
        builder: (context, state) => FutureBuilder(
            future: BankCubit.get(context).oneBank,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                {
                  final bank = snapshot.data;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: width > 900
                              ? 40.h
                              : MediaQuery.sizeOf(context).height > 500
                                  ? 10.h
                                  : 26.h),
                      child: Container(
                        padding: width > 900
                            ? EdgeInsets.all(30.h)
                            : width > 600
                                ? EdgeInsets.all(30.h)
                                : EdgeInsets.all(10.h),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor("#374151"),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      bank?.title != null
                                          ? bank?.title as String
                                          : "Bank",
                                      cursor: '',
                                      speed: const Duration(milliseconds: 100),
                                      textStyle: appStyle(context, 22,
                                          Colors.white, FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const HeightSpacer(15),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AnimatedTextKit(
                                        isRepeatingAnimation: false,
                                        stopPauseOnTap: false,
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                              "Balance amount",
                                              speed: const Duration(
                                                  milliseconds: 200),
                                              textStyle: appStyle(
                                                  context,
                                                  19,
                                                  Colors.grey.shade300,
                                                  FontWeight.bold),
                                              cursor: '')
                                        ],
                                      ),
                                      const HeightSpacer(5),
                                      Row(
                                        children: [
                                          AnimatedTextKit(
                                            isRepeatingAnimation: false,
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                  bank?.balance != null
                                                      ? bank?.balance.toString()
                                                          as String
                                                      : "0",
                                                  speed: const Duration(
                                                      milliseconds: 200),
                                                  textStyle: appStyle(
                                                      context,
                                                      20,
                                                      Colors.white,
                                                      FontWeight.w700),
                                                  cursor: '')
                                            ],
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          AnimatedTextKit(
                                            isRepeatingAnimation: false,
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                  bank?.currency
                                                              ?.currencyname !=
                                                          null
                                                      ? bank?.currency
                                                              ?.currencyname
                                                          as String
                                                      : "",
                                                  speed: const Duration(
                                                      milliseconds: 200),
                                                  textStyle: appStyle(
                                                      context,
                                                      20,
                                                      Colors.white,
                                                      FontWeight.w700),
                                                  cursor: '')
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Get.to(() => BankDetails());
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              editDialogBank(
                                                  context,
                                                  "Edit Bank",
                                                  bank!.id.toString());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5.h),
                                              decoration: BoxDecoration(
                                                color: HexColor("#9ca3af"),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.edit,
                                                color: HexColor("#FFFFFF"),
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            BankCubit.get(context).deleteBank(
                                                id: bank!.id.toString(),
                                                sub: bank.title.toString());
                                            Get.offAll(() => MainView(
                                                  x: 4,
                                                ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5.h),
                                            decoration: BoxDecoration(
                                              color: HexColor("#991b1b"),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: HexColor("#FFFFFF"),
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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
            }));
  }
}
