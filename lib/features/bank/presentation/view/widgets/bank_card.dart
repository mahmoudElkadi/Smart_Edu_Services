import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/bank/data/model/bank_model.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/heigher-spacer.dart';

class BankCard extends StatelessWidget {
  const BankCard(
      {super.key, required this.bankModel, this.onTap, this.onTapDelete});
  final BankModel bankModel;
  final void Function()? onTap;
  final void Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
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
                        bankModel.title != null
                            ? bankModel.title as String
                            : "Bank",
                        cursor: '',
                        speed: const Duration(milliseconds: 100),
                        textStyle: appStyle(
                            context, 22, Colors.white, FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              const HeightSpacer(15),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedTextKit(
                          isRepeatingAnimation: false,
                          stopPauseOnTap: false,
                          animatedTexts: [
                            TypewriterAnimatedText("Balance amount",
                                speed: const Duration(milliseconds: 200),
                                textStyle: appStyle(context, 19,
                                    Colors.grey.shade300, FontWeight.bold),
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
                                    bankModel.balance != null
                                        ? bankModel.balance.toString()
                                        : "0",
                                    speed: const Duration(milliseconds: 200),
                                    textStyle: appStyle(context, 20,
                                        Colors.white, FontWeight.w700),
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
                                    bankModel.currency != null
                                        ? bankModel.currency?.currencyname
                                            as String
                                        : "-",
                                    speed: const Duration(milliseconds: 200),
                                    textStyle: appStyle(context, 20,
                                        Colors.white, FontWeight.w700),
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
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: onTap,
                            child: Container(
                              padding: EdgeInsets.all(5.h),
                              decoration: BoxDecoration(
                                color: HexColor("#9ca3af"),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.info,
                                color: HexColor("#FFFFFF"),
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: onTapDelete,
                            child: Container(
                              padding: EdgeInsets.all(5.h),
                              decoration: BoxDecoration(
                                color: HexColor("#991b1b"),
                                borderRadius: BorderRadius.circular(5),
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
}
