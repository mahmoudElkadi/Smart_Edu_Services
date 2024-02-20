import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';
import 'package:smart/features/Main/presentation/views/main_view.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../manger/client cubit/client_state.dart';

class AddNewClientViewBody extends StatefulWidget {
  const AddNewClientViewBody({super.key});

  @override
  State<AddNewClientViewBody> createState() => _AddNewClientViewBodyState();
}

class _AddNewClientViewBodyState extends State<AddNewClientViewBody> {
  TextEditingController websiteController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var selectedCurrency;
  var selectedCountry;
  late String currencyValue;
  late String countryValue;

  @override
  void dispose() {
    websiteController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    ownerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.h),
                    child: GestureDetector(
                        onTap: () {
                          Get.offAll(() => const MainView(
                                x: 7,
                              ));
                        },
                        child: const Icon(Icons.arrow_back)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.13),
                    child: Text(
                      "Add New Client",
                      style:
                          appStyle(context, 20, Colors.black, FontWeight.w900),
                    ),
                  ),
                ],
              ),
              const HeightSpacer(25),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TaskTextItem(
                      title: "User Name",
                      hint: "User Name",
                      controller: userNameController,
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Owner",
                      hint: "Owner",
                      controller: ownerController,
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Email",
                      hint: "Email",
                      controller: websiteController,
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Phone",
                      hint: "Phone",
                      controller: phoneController,
                    ),
                    const HeightSpacer(15),
                    Drop(
                      text: 'Country',
                      selectedValue: selectedCountry,
                      hintText: 'Select Country',
                      items: countryModel!.countries
                          .map((item) => DropdownMenuItem<dynamic>(
                                value: item,
                                child: Text(
                                  item.countryName.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedCountry = selected;
                          countryValue = selected!.id;
                        });
                      },
                    ),
                    const HeightSpacer(15),
                    Drop(
                      text: 'Currency',
                      hintText: 'Select Currency',
                      selectedValue: selectedCurrency,
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
                        setState(() {
                          selectedCurrency = selected;
                          currencyValue = selected!.id;
                        });
                      },
                    ),
                    const HeightSpacer(15),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton2(
                        backGroundColor: Colors.blue,
                        widget: ClientCubit.get(context).isLoading == false
                            ? Text(
                                "Edit",
                                style: appStyle(
                                    context, 16, Colors.white, FontWeight.bold),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            ClientCubit.get(context).loading();
                            ClientCubit.get(context).createClient(
                                clientName: userNameController.text,
                                owner: ownerController.text,
                                phone: phoneController.text,
                                website: websiteController.text,
                                country: countryValue,
                                currency: currencyValue);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(50)
            ],
          )),
        ),
      ),
    );
  }
}
