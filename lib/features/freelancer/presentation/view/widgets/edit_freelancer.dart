import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart/core/widgets/dropdownItem.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_cubit.dart';
import 'package:smart/features/freelancer/presentation/manger/Freelancer%20cubit/Freelancer_state.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/model/one_freelancer_model.dart';

class EditFreelancer extends StatefulWidget {
  const EditFreelancer({super.key, this.oneFreelancerModel});
  final OneFreelancerModel? oneFreelancerModel;

  @override
  State<EditFreelancer> createState() => _EditFreelancerState();
}

class _EditFreelancerState extends State<EditFreelancer> {
  var selectedSpeciality;
  var selectedCurrency;
  var selectedCountry;
  late String specialityValue;
  late String currencyValue;
  late String countryValue;
  @override
  void initState() {
    FreelancerCubit.get(context).emailController.text =
        widget.oneFreelancerModel?.freelancer?.email as String;
    FreelancerCubit.get(context).userNameController.text =
        widget.oneFreelancerModel?.freelancer?.freelancername as String;

    FreelancerCubit.get(context).phoneController.text =
        widget.oneFreelancerModel?.freelancer?.phone.toString() as String;
    specialityValue =
        widget.oneFreelancerModel?.freelancer?.speciality?.id as String;
    countryValue = widget.oneFreelancerModel?.freelancer?.country?.id as String;
    currencyValue =
        widget.oneFreelancerModel?.freelancer?.currency?.id as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<FreelancerCubit, FreelancerState>(
        builder: (context, state) {
      return FutureBuilder(
          future: FreelancerCubit.get(context).oneFreelancer,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final freelancer = snapshot.data;

              return Form(
                key: formKey,
                child: Column(
                  children: [
                    TaskTextItem(
                        title: "User Name",
                        hint: "User Name",
                        controller:
                            FreelancerCubit.get(context).userNameController),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Email",
                      hint: "Email",
                      controller: FreelancerCubit.get(context).emailController,
                    ),
                    const HeightSpacer(15),
                    TaskTextItem(
                      title: "Phone",
                      hint: "Phone",
                      controller: FreelancerCubit.get(context).phoneController,
                    ),
                    const HeightSpacer(15),
                    Drop(
                      text: 'Country',
                      selectedValue: selectedCountry,
                      hintText: freelancer?.freelancer?.country?.countryName
                          as String,
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
                          Get.snackbar(countryValue, '');
                          setState(() {});
                        });
                      },
                    ),
                    const HeightSpacer(15),
                    Drop(
                      text: 'Currency',
                      hintText: freelancer?.freelancer?.currency?.currencyname
                          as String,
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
                      hintText: freelancer?.freelancer?.speciality?.speciality
                          as String,
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
                    const HeightSpacer(40),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton2(
                        backGroundColor: Colors.blue,
                        widget: FreelancerCubit.get(context).isLoading == false
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
                            FreelancerCubit.get(context).loading();
                            FreelancerCubit.get(context).updateFreelancer(
                              id: freelancer?.freelancer?.id as String,
                              name: FreelancerCubit.get(context)
                                  .userNameController
                                  .text,
                              email: FreelancerCubit.get(context)
                                  .emailController
                                  .text,
                              phone: FreelancerCubit.get(context)
                                  .phoneController
                                  .text,
                              country: countryValue,
                              currency: currencyValue,
                              speciality: specialityValue,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return throw Exception(snapshot.error);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
