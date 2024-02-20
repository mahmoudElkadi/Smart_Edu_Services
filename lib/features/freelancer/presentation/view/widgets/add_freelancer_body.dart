import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/app_style.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Main/presentation/views/main_view.dart';
import 'package:smart/features/Task%20page/presentation/view/widgets/text_field_item.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_cubit.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_state.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/dropdownItem.dart';

class AddNewFreelancerViewBody extends StatefulWidget {
  const AddNewFreelancerViewBody({super.key});

  @override
  State<AddNewFreelancerViewBody> createState() =>
      _AddNewFreelancerViewBodyState();
}

class _AddNewFreelancerViewBodyState extends State<AddNewFreelancerViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    password.dispose();
    super.dispose();
  }

  var selectedSpeciality;
  var selectedCurrency;
  var selectedCountry;
  late String specialityValue;
  late String currencyValue;
  late String countryValue;

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<FreelancerCubit, FreelancerState>(
        builder: (context, state) => FutureBuilder(
            future: FreelancerCubit.get(context).allFreelancer,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final freelancers = snapshot.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15.0.h),
                    child: SafeArea(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.offAll(() => const MainView(x: 6));
                                  },
                                  child: const Icon(Icons.arrow_back)),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.sizeOf(context).width *
                                        0.12),
                                child: Text(
                                  "Add New Freelancer",
                                  style: appStyle(context, 20, Colors.black,
                                      FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const HeightSpacer(50),
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
                                title: "Email",
                                hint: "Email",
                                controller: emailController,
                              ),
                              const HeightSpacer(15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: appStyle(context, 16, Colors.black,
                                        FontWeight.w500),
                                    maxLines: 2,
                                  ),
                                  const HeightSpacer(10),
                                  CustomTextField(
                                    controller: password,
                                    hintText: "Password",
                                    hintColor: Colors.black,
                                    color: Colors.transparent,
                                    keyboardType: TextInputType.text,
                                    obscureText: FreelancerCubit.get(context)
                                        .obscureText,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          FreelancerCubit.get(context)
                                                  .obscureText =
                                              !FreelancerCubit.get(context)
                                                  .obscureText;
                                        });
                                      },
                                      child: FreelancerCubit.get(context)
                                                  .obscureText ==
                                              false
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Password must not be Empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const HeightSpacer(15),
                              TaskTextItem(
                                title: "Phone",
                                hint: "Phone",
                                controller: phoneController,
                              ),
                              const HeightSpacer(15),
                              Drop(
                                border: 0.5,
                                hintText: 'Select Speciality',
                                text: 'Speciality',
                                selectedValue: selectedSpeciality,
                                items: specialityModel!.specialities
                                    .map((item) => DropdownMenuItem<dynamic>(
                                          value: item,
                                          child: Text(
                                            item.subSpeciality.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (selected) {
                                  setState(() {
                                    selectedSpeciality = selected;
                                    specialityValue = selected!.id;
                                  });
                                },
                              ),
                              const HeightSpacer(15),
                              Drop(
                                border: 0.5,
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
                              Drop(
                                border: 0.5,
                                text: 'Country',
                                hintText: 'Select Country',
                                selectedValue: selectedCountry,
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
                              const HeightSpacer(40),
                              Align(
                                alignment: Alignment.center,
                                child: CustomButton2(
                                  backGroundColor: Colors.blue,
                                  widget:
                                      FreelancerCubit.get(context).isLoading ==
                                              false
                                          ? Text(
                                              "Edit",
                                              style: appStyle(
                                                  context,
                                                  16,
                                                  Colors.white,
                                                  FontWeight.bold),
                                            )
                                          : const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      await FreelancerCubit.get(context)
                                          .createFreelancer(
                                              name: userNameController.text,
                                              email: emailController.text,
                                              phone: phoneController.text,
                                              country: countryValue,
                                              currency: currencyValue,
                                              speciality: specialityValue,
                                              password: password.text);
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
                );
              } else if (snapshot.hasError) {
                return throw Exception(snapshot.error);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
