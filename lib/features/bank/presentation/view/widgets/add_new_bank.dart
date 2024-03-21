import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_cubit.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_cubit.dart';
import 'package:smart/features/bank/presentation/manger/bank%20cubit/bank_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Main/presentation/views/main_view.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/repos/bank_repo_impl.dart';

Future openDialogBank(BuildContext context, String text) {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => BankCubit(BankRepoImpl()),
      child: BlocBuilder<BankCubit, BankState>(
        builder: (context, state) => Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpacer(15),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => const MainView(
                              x: 4,
                            ));
                      },
                      child: Text(
                        'X',
                        style: appStyle(
                            context, 25, Colors.black, FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        const HeightSpacer(0),
                        Text(
                          text,
                          style: appStyle(
                              context, 20, Colors.black, FontWeight.bold),
                        ),
                        const HeightSpacer(10),
                        TaskTextItem(
                            type: 'Title',
                            title: "Title",
                            hint: "Title",
                            controller: BankCubit.get(context).accountTitle),
                        const HeightSpacer(15),
                        TaskTextItem(
                            type: 'Balance',
                            title: "Balance",
                            hint: "Balance",
                            controller: BankCubit.get(context).accountBalance),
                        const HeightSpacer(15),
                        Drop(
                          hintColor: Colors.grey,
                          text: " Currency",
                          hintText: "Select Currency",
                          selectedValue:
                              BankCubit.get(context).selectedCurrency,
                          items: currencyModel!.currencies
                              .map((item) => DropdownMenuItem<dynamic>(
                                    value: item,
                                    child: Text(
                                      item.currencyname.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (selected) {
                            BankCubit.get(context).selectedCurrency = selected;
                            BankCubit.get(context).currencyValue = selected!.id;
                            BankCubit.get(context).changeState();
                          },
                        ),
                        const HeightSpacer(30),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton2(
                            backGroundColor: Colors.blue,
                            widget:
                                SpecialityCubit.get(context).isLoading == false
                                    ? Text(
                                        text,
                                        style: appStyle(context, 16,
                                            Colors.white, FontWeight.bold),
                                      )
                                    : const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                BankCubit.get(context).createBank(
                                    title: BankCubit.get(context)
                                        .accountTitle
                                        .text,
                                    currency:
                                        BankCubit.get(context).currencyValue,
                                    balance: int.parse(BankCubit.get(context)
                                        .accountBalance
                                        .text));
                              }
                            },
                          ),
                        ),
                        const HeightSpacer(25),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
