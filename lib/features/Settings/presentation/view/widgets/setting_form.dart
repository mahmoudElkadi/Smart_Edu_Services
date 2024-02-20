import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:smart/core/utils/constant.dart';
import 'package:smart/core/widgets/heigher-spacer.dart';
import 'package:smart/features/Users/data/repos/user_repo_impl.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_cubit.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_state.dart';

import '../../../../../core/Network/shared.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../../../core/widgets/dropdownItem.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  var selectedCountry;
  late String countryValue;
  @override
  void dispose() {
    userNameController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    userRoleController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userId = CacheHelper.getData(key: "userId");
    late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
        create: (context) => UserCubit(UserRepoImpl())..getOneUser(userId!),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) => FutureBuilder(
              future: UserCubit.get(context).oneUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;
                  if (state is GetOneUserSuccess) {
                    phoneController.text = user?.user?.phone.toString() ?? "";
                    fullNameController.text =
                        user?.user?.fullname.toString() ?? "";
                    userNameController.text =
                        user?.user?.username.toString() ?? "";
                    userRoleController.text =
                        user?.user?.userRole.toString() ?? "";
                    countryValue = user?.user?.country?.id.toString() ?? "";
                  }
                  return Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: userNameController,
                          keyboardType: TextInputType.name,
                          hintText: "User Name",
                          prefixIcon: const Icon(Icons.person),
                          color: Colors.transparent,
                        ),
                        const HeightSpacer(15),
                        CustomTextField(
                          controller: fullNameController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.email),
                          color: Colors.transparent,
                        ),
                        const HeightSpacer(15),
                        CustomTextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: "Phone",
                          prefixIcon: const Icon(Icons.phone),
                          color: Colors.transparent,
                        ),
                        const HeightSpacer(15),
                        CustomTextField(
                          controller: userRoleController,
                          keyboardType: TextInputType.name,
                          hintText: "User Role",
                          prefixIcon: const Icon(Symbols.pen_size_4),
                          color: Colors.transparent,
                        ),
                        const HeightSpacer(5),
                        Drop(
                          selectedValue: selectedCountry,
                          hintText:
                              user?.user?.country?.countryName.toString() ??
                                  '-',
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
                        const HeightSpacer(30),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton2(
                            backGroundColor: Colors.green,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            widget: UserCubit.get(context).isLoading == false
                                ? Text(
                                    "Edit",
                                    style: appStyle(context, 20, Colors.white,
                                        FontWeight.bold),
                                  )
                                : const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                            onTap: () {
                              UserCubit.get(context).loading();
                              UserCubit.get(context).updateInfo(
                                id: userId.toString(),
                                fullName: fullNameController.text,
                                userName: userNameController.text,
                                phone: phoneController.text,
                                country: countryValue,
                                userRole: userRoleController.text,
                              );
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
              }),
        ));
  }
}
