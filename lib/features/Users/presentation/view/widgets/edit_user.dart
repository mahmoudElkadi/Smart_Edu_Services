import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dropdownItem.dart';
import '../../../../../core/widgets/heigher-spacer.dart';
import '../../../../Task page/presentation/view/widgets/text_field_item.dart';
import '../../../data/models/one_user_model.dart';
import '../../manger/user cubit/user_cubit.dart';
import '../../manger/user cubit/user_state.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key, this.oneUserModel});
  final OneUserModel? oneUserModel;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  var selectedSpeciality;
  var selectedCountry;
  var selectedRole;
  late String specialityValue;

  late String countryValue;
  String? roleValue;
  @override
  void initState() {
    UserCubit.get(context).phoneController.text =
        widget.oneUserModel?.user?.phone.toString() ?? "";
    UserCubit.get(context).fullNameController.text =
        widget.oneUserModel?.user?.fullname.toString() ?? "";
    UserCubit.get(context).userNameController.text =
        widget.oneUserModel?.user?.username.toString() ?? "";
    roleValue = widget.oneUserModel?.user?.userRole.toString() ?? "";
    countryValue = widget.oneUserModel?.user?.country?.id.toString() ?? "";
    specialityValue =
        widget.oneUserModel?.user?.speciality?.id.toString() ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return FutureBuilder(
          future: UserCubit.get(context).oneUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TaskTextItem(
                          title: "User Name",
                          hint: "User Name",
                          controller:
                              UserCubit.get(context).userNameController),
                      const HeightSpacer(15),
                      TaskTextItem(
                        title: "Full Name",
                        hint: "Full Name",
                        controller: UserCubit.get(context).fullNameController,
                      ),
                      const HeightSpacer(15),
                      TaskTextItem(
                        title: "Phone",
                        hint: "Phone",
                        controller: UserCubit.get(context).phoneController,
                      ),
                      const HeightSpacer(15),
                      Drop(
                        text: 'User Role',
                        selectedValue: roleValue,
                        hintText: user?.user?.userRole.toString() ??
                            'Select User Role',
                        items: UserCubit.get(context)
                            .userRole
                            .map((item) => DropdownMenuItem<dynamic>(
                                  value: item,
                                  child: Text(
                                    item.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (selected) {
                          setState(() {
                            selectedRole = selected;

                            roleValue = selected;
                          });
                        },
                      ),
                      const HeightSpacer(15),
                      Drop(
                        text: 'Country',
                        selectedValue: selectedCountry,
                        hintText:
                            user?.user?.country?.countryName.toString() ?? '-',
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
                        hintText: widget.oneUserModel?.user?.speciality
                                ?.subSpeciality ??
                            "Select Speciality",
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
                          backGroundColor: Colors.green,
                          widget: UserCubit.get(context).isLoading == false
                              ? Text(
                                  "Edit",
                                  style: appStyle(context, 16, Colors.white,
                                      FontWeight.bold),
                                )
                              : const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              UserCubit.get(context).loading();
                              UserCubit.get(context).updateUser(
                                id: user!.user!.id.toString(),
                                fullName: UserCubit.get(context)
                                    .fullNameController
                                    .text,
                                userName: UserCubit.get(context)
                                    .userNameController
                                    .text,
                                phone:
                                    UserCubit.get(context).phoneController.text,
                                userRole: roleValue!,
                                country: countryValue,
                                userType: user.user?.userType.toString() ?? "",
                                speciality: specialityValue,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
