import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/repos/currency_repo_impl.dart';
import '../../manger/Task cubit/currency_cubit.dart';
import '../../manger/Task cubit/currency_state.dart';

Future editCurrenciesDialog(BuildContext context, id) {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) =>
          CurrenciesCubit(CurrenciesRepoImpl())..getOneCurrencies(id),
      child: BlocBuilder<CurrenciesCubit, CurrenciesState>(
        builder: (context, state) => Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: FutureBuilder(
              future: CurrenciesCubit.get(context).oneCurrencies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final currency = snapshot.data;
                  if (state is GetOneCurrenciesSuccess) {
                    CurrenciesCubit.get(context)
                        .editNameCurrenciesController
                        .text = currency?.message?.currencyname as String;
                    CurrenciesCubit.get(context)
                        .editPriceCurrenciesController
                        .text = currency!.message!.priceToEgp.toString();
                  }

                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(15.0.h),
                      child: SafeArea(
                          child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const HeightSpacer(20),
                            Text(
                              "Edit Currency",
                              style: appStyle(
                                  context, 20, Colors.black, FontWeight.w900),
                            ),
                            const HeightSpacer(50),
                            TaskTextItem(
                              title: "Currency Name",
                              hint: "Currency Name",
                              controller: CurrenciesCubit.get(context)
                                  .editNameCurrenciesController,
                            ),
                            const HeightSpacer(15),
                            TaskTextItem(
                              title: "Currency Price",
                              hint: "Currency Name",
                              controller: CurrenciesCubit.get(context)
                                  .editPriceCurrenciesController,
                            ),
                            const HeightSpacer(15),
                            DropdownItem(
                              searchController: CurrenciesCubit.get(context)
                                  .expireCurrenciesController,
                              items: CurrenciesCubit.get(context).expire,
                              hintText: 'Expire',
                              label: 'Expire',
                            ),
                            const HeightSpacer(30),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton2(
                                backGroundColor: Colors.blue,
                                widget:
                                    CurrenciesCubit.get(context).isLoading ==
                                            false
                                        ? Text(
                                            "Edit",
                                            style: appStyle(context, 16,
                                                Colors.white, FontWeight.bold),
                                          )
                                        : const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    CurrenciesCubit.get(context).loading();
                                    CurrenciesCubit.get(context).updateCurrency(
                                      name: CurrenciesCubit.get(context)
                                          .editNameCurrenciesController
                                          .text,
                                      price: CurrenciesCubit.get(context)
                                          .editPriceCurrenciesController
                                          .text,
                                      id: id,
                                      expire: CurrenciesCubit.get(context)
                                          .expireCurrenciesController
                                          .text,
                                    );
                                  }
                                },
                              ),
                            ),
                            const HeightSpacer(50)
                          ],
                        ),
                      )),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return throw Exception(snapshot.hasError);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    ),
  );
}
