import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/repos/currency_repo_impl.dart';
import '../../manger/Task cubit/currency_cubit.dart';
import '../../manger/Task cubit/currency_state.dart';

Future openCurrenciesDialog(BuildContext context) {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => CurrenciesCubit(CurrenciesRepoImpl()),
      child: BlocBuilder<CurrenciesCubit, CurrenciesState>(
        builder: (context, state) => Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0.h),
              child: SafeArea(
                  child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeightSpacer(20),
                    Text(
                      "Add New Currency",
                      style:
                          appStyle(context, 20, Colors.black, FontWeight.w900),
                    ),
                    const HeightSpacer(50),
                    TaskTextItem(
                      title: "Currency Name",
                      hint: "Currency Name",
                      controller:
                          CurrenciesCubit.get(context).currencyNameController,
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Currency Price",
                      hint: "Currency Name",
                      controller:
                          CurrenciesCubit.get(context).currencyPriceController,
                    ),
                    const HeightSpacer(30),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton2(
                        backGroundColor: Colors.blue,
                        widget: CurrenciesCubit.get(context).isLoading == false
                            ? Text(
                                "Add",
                                style: appStyle(
                                    context, 16, Colors.white, FontWeight.bold),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            CurrenciesCubit.get(context).loading();
                            CurrenciesCubit.get(context).createCurrency(
                                name: CurrenciesCubit.get(context)
                                    .currencyNameController
                                    .text,
                                price: CurrenciesCubit.get(context)
                                    .currencyPriceController
                                    .text);
                          }
                        },
                      ),
                    ),
                    const HeightSpacer(50)
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    ),
  );
}
